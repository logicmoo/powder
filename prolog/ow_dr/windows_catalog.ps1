param(
    [Parameter(Mandatory=$true)][string]$Root,
    [ValidateSet('catalog','authorize','files')][string]$Mode = 'catalog'
)
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)
$rootInfo = [System.IO.DirectoryInfo]::new($Root)
$reparse = [System.IO.FileAttributes]::ReparsePoint
if (($rootInfo.Attributes -band $reparse) -ne 0) { throw 'KB root is a reparse point' }
$prefix = $rootInfo.FullName.TrimEnd('\') + '\'
$supported = @('.kif', '.krf', '.metta')
$result = [System.Collections.Generic.List[object]]::new()
if ($Mode -eq 'authorize') {
    $PathsJson = [Console]::In.ReadToEnd()
    $checked = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($inputPath in (ConvertFrom-Json $PathsJson)) {
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
        $result.Add($full)
    }
} else {
    $pending = [System.Collections.Generic.Stack[System.IO.DirectoryInfo]]::new()
    $pending.Push($rootInfo)
    while ($pending.Count -gt 0) {
        $dir = $pending.Pop()
        foreach ($entry in $dir.EnumerateFileSystemInfos()) {
            if (($entry.Attributes -band $reparse) -ne 0) { continue }
            if ($entry -is [System.IO.DirectoryInfo]) { $pending.Push($entry) }
            elseif ($Mode -eq 'files' -or $supported -contains $entry.Extension.ToLowerInvariant()) {
                $result.Add(@{path=$entry.FullName;sizeBytes=$entry.Length;modified=$entry.LastWriteTimeUtc.Ticks.ToString()})
            }
        }
    }
}
ConvertTo-Json -InputObject @($result.ToArray()) -Compress -Depth 5
