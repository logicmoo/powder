param(
    [ValidateSet('create','remove','verify')][string]$Mode,
    [string]$CredentialFile
)
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)
$sid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User
$base = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)
$root = Join-Path $base 'powder-local-debug'

function Assert-NoReparse([string]$Path) {
    $item = Get-Item -LiteralPath $Path -Force
    if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
        throw 'Reparse paths are not accepted.'
    }
}
function Private-DirectorySecurity {
    $acl = New-Object Security.AccessControl.DirectorySecurity
    $acl.SetOwner($sid)
    $acl.SetAccessRuleProtection($true,$false)
    $rule = New-Object Security.AccessControl.FileSystemAccessRule(
        $sid,'FullControl','ContainerInherit,ObjectInherit','None','Allow')
    $acl.AddAccessRule($rule)
    return $acl
}
function Assert-Private([string]$Path) {
    Assert-NoReparse $Path
    $acl = Get-Acl -LiteralPath $Path
    if ($acl.GetOwner([Security.Principal.SecurityIdentifier]).Value -ne $sid.Value) {
        throw 'Wrong credential owner.'
    }
    if (-not $acl.AreAccessRulesProtected) { throw 'Credential ACL inherits permissions.' }
    $rules = @($acl.GetAccessRules($true,$true,[Security.Principal.SecurityIdentifier]))
    if ($rules.Count -ne 1 -or $rules[0].IdentityReference.Value -ne $sid.Value -or
        $rules[0].AccessControlType -ne 'Allow' -or $rules[0].FileSystemRights -ne 'FullControl') {
        throw 'Credential ACL is not owner-only.'
    }
}

try {
    $stage = 'profile'
    $ancestor = $base
    while ($ancestor) {
        Assert-NoReparse $ancestor
        $ancestor = Split-Path $ancestor -Parent
    }
    if ($Mode -eq 'create') {
        $stage = 'input'
        $data = [Console]::In.ReadToEnd() | ConvertFrom-Json
        if ($data.version -ne 1 -or $data.host -ne '127.0.0.1' -or
            $data.token -cnotmatch '^[0-9a-f]{64}$' -or
            $data.port -lt 1 -or $data.port -gt 65535 -or $data.pid -lt 1) {
            throw 'Invalid private credential request.'
        }
        $stage = 'private-root'
        if (-not [IO.Directory]::Exists($root)) {
            [IO.Directory]::CreateDirectory($root,(Private-DirectorySecurity)) | Out-Null
        }
        Assert-Private $root
        $stage = 'private-directory'
        $directory = Join-Path $root ($data.pid.ToString() + '-' + [Guid]::NewGuid().ToString('N'))
        [IO.Directory]::CreateDirectory($directory,(Private-DirectorySecurity)) | Out-Null
        Assert-Private $directory
        $file = Join-Path $directory 'credentials.json'
        $acl = New-Object Security.AccessControl.FileSecurity
        $acl.SetOwner($sid)
        $acl.SetAccessRuleProtection($true,$false)
        $acl.AddAccessRule((New-Object Security.AccessControl.FileSystemAccessRule($sid,'FullControl','Allow')))
        $stage = 'private-file'
        $stream = New-Object IO.FileStream($file,[IO.FileMode]::CreateNew,
            [Security.AccessControl.FileSystemRights]::FullControl,[IO.FileShare]::None,
            4096,[IO.FileOptions]::WriteThrough,$acl)
        try {
            $bytes = [Text.Encoding]::UTF8.GetBytes(($data | ConvertTo-Json -Compress))
            $stream.Write($bytes,0,$bytes.Length)
            $stream.Flush($true)
        } finally { $stream.Dispose() }
        Assert-Private $file
        [Console]::Out.WriteLine($file)
    } else {
        $file = [IO.Path]::GetFullPath($CredentialFile)
        $directory = [IO.Path]::GetDirectoryName($file)
        if ([IO.Path]::GetDirectoryName($directory) -ne $root -or
            [IO.Path]::GetFileName($file) -ne 'credentials.json') {
            throw 'Not an owned credential location.'
        }
        Assert-Private $root
        if ([IO.Directory]::Exists($directory)) {
            Assert-Private $directory
            if ([IO.File]::Exists($file)) {
                Assert-Private $file
                if ($Mode -eq 'remove') { [IO.File]::Delete($file) }
            }
            if ($Mode -eq 'remove') { [IO.Directory]::Delete($directory,$false) }
        } elseif ($Mode -eq 'verify') { throw 'Missing credential.' }
        [Console]::Out.WriteLine('private')
    }
} catch {
    # Never print the exception/request: it might contain credential material.
    if ($Mode -eq 'create' -and $directory -and [IO.Directory]::Exists($directory)) {
        if ($file -and [IO.File]::Exists($file)) { [IO.File]::Delete($file) }
        [IO.Directory]::Delete($directory,$false)
    }
    [Console]::Error.WriteLine('Private credential operation failed at stage: ' + $stage)
    exit 1
}
