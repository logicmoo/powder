param(
    [Parameter(Mandatory=$true)][string]$Root,
    [ValidateSet('catalog','authorize','statistics','mt_statistics','directory_statistics','artifacts','files')][string]$Mode = 'catalog',
    [string]$CacheRoot
)
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)
$rootInfo = [System.IO.DirectoryInfo]::new($Root)
$reparse = [System.IO.FileAttributes]::ReparsePoint
if (($rootInfo.Attributes -band $reparse) -ne 0) { throw 'KB root is a reparse point' }
$prefix = $rootInfo.FullName.TrimEnd('\') + '\'
$supported = @('.kif', '.krf', '.meld', '.metta')
$result = [System.Collections.Generic.List[object]]::new()
if ($Mode -eq 'artifacts') {
    if (!$CacheRoot) { throw 'Cache root is required' }
    $cacheFull = [System.IO.Path]::GetFullPath($CacheRoot).TrimEnd('\')
    $repository = $rootInfo.Parent.FullName
    if (!$cacheFull.StartsWith($repository.TrimEnd('\') + '\', [StringComparison]::OrdinalIgnoreCase)) { throw 'Cache root escapes repository' }
    $artifactParents = [System.Collections.Generic.Dictionary[string,string]]::new([StringComparer]::OrdinalIgnoreCase)
}
function Get-ArtifactParentState([string]$directory) {
    if ($artifactParents.ContainsKey($directory)) { return $artifactParents[$directory] }
    if (![StringComparer]::OrdinalIgnoreCase.Equals($directory, $repository)) {
        $parent = [System.IO.Directory]::GetParent($directory)
        if (!$parent -or $parent.FullName.Length -lt $repository.Length) { return 'unavailable' }
        $parentState = Get-ArtifactParentState $parent.FullName
        if ($parentState -ne 'safe') { $artifactParents[$directory] = $parentState; return $parentState }
    }
    try {
        $attributes = [System.IO.File]::GetAttributes($directory)
        if (($attributes -band $reparse) -ne 0 -or ($attributes -band [System.IO.FileAttributes]::Directory) -eq 0) { $state = 'unavailable' }
        else { $state = 'safe' }
    } catch [System.IO.FileNotFoundException] { $state = 'missing' }
      catch [System.IO.DirectoryNotFoundException] { $state = 'missing' }
      catch { $state = 'unavailable' }
    $artifactParents[$directory] = $state
    return $state
}
function Get-ArtifactPresence([string]$path) {
    try {
        $full = [System.IO.Path]::GetFullPath($path)
        if (!$full.StartsWith($cacheFull + '\', [StringComparison]::OrdinalIgnoreCase)) { return $null }
        $parentState = Get-ArtifactParentState ([System.IO.Path]::GetDirectoryName($full))
        if ($parentState -eq 'missing') { return $false }
        if ($parentState -ne 'safe') { return $null }
        $attributes = [System.IO.File]::GetAttributes($full)
        if (($attributes -band $reparse) -ne 0 -or ($attributes -band [System.IO.FileAttributes]::Directory) -ne 0) { return $null }
        return $true
    } catch [System.IO.FileNotFoundException] { return $false }
      catch [System.IO.DirectoryNotFoundException] { return $false }
      catch { return $null }
}
if ($Mode -eq 'mt_statistics') {
    $directory = [System.IO.Path]::Combine($rootInfo.FullName, 'microtheory')
    foreach ($inputPath in (ConvertFrom-Json ([Console]::In.ReadToEnd()))) {
        $full = [System.IO.Path]::GetFullPath($inputPath)
        $file = [System.IO.FileInfo]::new($full)
        if (![StringComparer]::OrdinalIgnoreCase.Equals($file.DirectoryName, $directory) -or
            $file.Extension -ne '.json' -or $file.Name.Contains(':')) { throw 'Not a microtheory inventory filename' }
        $availability = 'missing'
        if ($file.Exists) { $availability = 'available' }
        $entry = $file
        while ($entry -and $entry.FullName.Length -ge $rootInfo.FullName.Length) {
            $attributes = $entry.Attributes
            if ($attributes -ne -1 -and (($attributes -band $reparse) -ne 0 -or
                ($entry -is [System.IO.FileInfo] -and ($attributes -band [System.IO.FileAttributes]::Directory) -ne 0))) {
                $availability = 'unsafe'; break
            }
            if ($entry -is [System.IO.FileInfo]) { $entry = $entry.Directory } else { $entry = $entry.Parent }
        }
        $result.Add(@{path=$full;availability=$availability})
    }
} elseif ($Mode -eq 'authorize' -or $Mode -eq 'statistics' -or $Mode -eq 'artifacts') {
    $PathsJson = [Console]::In.ReadToEnd()
    $checked = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    # @(... ConvertFrom-Json ...) nests JSON arrays on Windows PowerShell 5.
    $inputs = ConvertFrom-Json $PathsJson
    if ($null -eq $inputs) { $inputs = @() }
    elseif ($inputs -isnot [array]) { $inputs = ,$inputs }
    $inputCount = $inputs.Length
    if ($Mode -eq 'artifacts' -and $inputCount -gt 4096) { throw 'Artifact batch limit exceeded' }
    foreach ($inputItem in $inputs) {
        if ($Mode -eq 'artifacts') { $inputPath = $inputItem.source } else { $inputPath = $inputItem }
        if ($inputPath -isnot [string]) { throw 'A concrete source path must be a string' }
        $full = [System.IO.Path]::GetFullPath($inputPath)
        if (!$full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'Source escapes KB root' }
        $file = [System.IO.FileInfo]::new($full)
        if (!$file.Exists -or $supported -notcontains $file.Extension.ToLowerInvariant()) { throw 'Not an original KB source' }
        $entry = $file
        while ($entry -and $entry.FullName.Length -ge $rootInfo.FullName.Length) {
            if (!$checked.Add($entry.FullName)) { break }
            if (($entry.Attributes -band $reparse) -ne 0) { throw 'Source contains a reparse point' }
            if ($entry -is [System.IO.FileInfo]) { $entry = $entry.Directory } else { $entry = $entry.Parent }
        }
        if ($Mode -eq 'statistics') {
            $sidecar = [System.IO.FileInfo]::new($full + '.inventory.json')
            $attributes = $sidecar.Attributes
            if ($attributes -ne -1 -and (($attributes -band $reparse) -ne 0 -or ($attributes -band [System.IO.FileAttributes]::Directory) -ne 0)) {
                $availability = 'unsafe'
            } elseif ($sidecar.Exists) { $availability = 'available' }
            else { $availability = 'missing' }
            $result.Add(@{path=$full;availability=$availability})
        } elseif ($Mode -eq 'artifacts') {
            $result.Add(@{path=$full;sizeBytes=$file.Length;cached=(Get-ArtifactPresence $inputItem.data);indexed=(Get-ArtifactPresence $inputItem.index)})
        } else { $result.Add($full) }
    }
} else {
    $scanRoot = $rootInfo
    if ($Mode -eq 'directory_statistics') {
        $inputs = ConvertFrom-Json ([Console]::In.ReadToEnd())
        if ($null -eq $inputs) { $inputs = @() }
        elseif ($inputs -isnot [array]) { $inputs = ,$inputs }
        if ($inputs.Length -ne 1 -or $inputs[0] -isnot [string]) { throw 'One directory is required' }
        $full = [System.IO.Path]::GetFullPath($inputs[0])
        if (![StringComparer]::OrdinalIgnoreCase.Equals($full, $rootInfo.FullName) -and
            !$full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'Directory escapes KB root' }
        $scanRoot = [System.IO.DirectoryInfo]::new($full)
        if (!$scanRoot.Exists) { throw 'Directory does not exist' }
        $entry = $scanRoot
        while ($entry -and $entry.FullName.Length -ge $rootInfo.FullName.Length) {
            if (($entry.Attributes -band $reparse) -ne 0) { throw 'Directory contains a reparse point' }
            $entry = $entry.Parent
        }
    }
    $pending = [System.Collections.Generic.Stack[System.IO.DirectoryInfo]]::new()
    $pending.Push($scanRoot)
    while ($pending.Count -gt 0) {
        $dir = $pending.Pop()
        foreach ($entry in $dir.EnumerateFileSystemInfos()) {
            if (($entry.Attributes -band $reparse) -ne 0) { continue }
            if ($entry -is [System.IO.DirectoryInfo]) { $pending.Push($entry) }
            elseif ($Mode -eq 'files' -or $supported -contains $entry.Extension.ToLowerInvariant()) {
                $record = @{path=$entry.FullName;sizeBytes=$entry.Length;modified=$entry.LastWriteTimeUtc.Ticks.ToString()}
                if ($Mode -eq 'directory_statistics') {
                    $sidecar = [System.IO.FileInfo]::new($entry.FullName + '.inventory.json')
                    $attributes = $sidecar.Attributes
                    $record.inventorySize = $null; $record.inventoryModified = $null
                    if ($attributes -ne -1 -and (($attributes -band $reparse) -ne 0 -or ($attributes -band [System.IO.FileAttributes]::Directory) -ne 0)) {
                        $record.inventoryState = 'unsafe'
                    } elseif ($sidecar.Exists) {
                        $record.inventoryState = 'available'
                        $record.inventorySize = $sidecar.Length
                        $record.inventoryModified = $sidecar.LastWriteTimeUtc.Ticks.ToString()
                    } else { $record.inventoryState = 'missing' }
                }
                $result.Add($record)
            }
        }
    }
}
ConvertTo-Json -InputObject @($result.ToArray()) -Compress -Depth 5
