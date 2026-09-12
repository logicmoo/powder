$ErrorActionPreference = 'Stop'
$path = [Console]::In.ReadLine()
if ([String]::IsNullOrWhiteSpace($path) -or -not [IO.Path]::IsPathRooted($path)) {
    throw 'Checkpoint IPC requires an absolute directory.'
}
$path = [IO.Path]::GetFullPath($path)
$parent = [IO.Directory]::GetParent($path)
if ($null -eq $parent -or -not $parent.Exists -or [IO.Directory]::Exists($path) -or [IO.File]::Exists($path)) {
    throw 'Checkpoint IPC requires a fresh child of an existing directory.'
}
for ($node = $parent; $null -ne $node; $node = $node.Parent) {
    if (($node.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
        throw 'Checkpoint IPC ancestor is a reparse point.'
    }
}
$sid = [Security.Principal.WindowsIdentity]::GetCurrent().User
$acl = New-Object Security.AccessControl.DirectorySecurity
$acl.SetOwner($sid)
$acl.SetAccessRuleProtection($true, $false)
$rule = New-Object Security.AccessControl.FileSystemAccessRule(
    $sid, 'FullControl', 'ContainerInherit,ObjectInherit', 'None', 'Allow')
$acl.AddAccessRule($rule)
$created = [IO.Directory]::CreateDirectory($path, $acl)
if (($created.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
    throw 'Checkpoint IPC directory is a reparse point.'
}
$actual = $created.GetAccessControl()
if (-not $actual.AreAccessRulesProtected -or $actual.GetOwner([Security.Principal.SecurityIdentifier]) -ne $sid) {
    throw 'Checkpoint IPC directory ownership was not established.'
}
foreach ($entry in $actual.GetAccessRules($true, $true, [Security.Principal.SecurityIdentifier])) {
    if ($entry.IdentityReference -ne $sid -or $entry.AccessControlType -ne 'Allow') {
        throw 'Checkpoint IPC directory is not owner-only.'
    }
}
