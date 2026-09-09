param(
    [Parameter(Mandatory=$true)][ValidateSet('junction','remove-junction')][string]$Action,
    [Parameter(Mandatory=$true)][string]$Path,
    [string]$Target
)
$ErrorActionPreference = 'Stop'
if ($Action -eq 'junction') {
    New-Item -ItemType Junction -Path $Path -Target $Target | Out-Null
} else {
    $entry = [System.IO.DirectoryInfo]::new($Path)
    if (($entry.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -eq 0) {
        throw 'Refusing to remove a directory that is not a junction'
    }
    [System.IO.Directory]::Delete($Path)
}
