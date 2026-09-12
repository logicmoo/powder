param([string]$Swipl = 'swipl.exe', [switch]$Interactive)
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$swiplPath = (Get-Command $Swipl -ErrorAction Stop).Source
$swiHome = Split-Path (Split-Path $swiplPath -Parent) -Parent
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (-not (Test-Path $vswhere)) { throw 'Visual C++ Build Tools are required for this Windows adapter.' }
$vcvars = & $vswhere -latest -products '*' -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -find 'VC\Auxiliary\Build\vcvars64.bat'
if (-not $vcvars) { throw 'The installed Visual Studio has no x64 C++ Build Tools.' }
$env:Path = (Split-Path $vswhere -Parent) + ';' + $env:Path
$stem = 'kb_lifecycle_windows'
if ($Interactive) { $stem = 'kb_interactive_windows' }
$build = Join-Path $root ('.lifecycle-build-' + $stem)
New-Item -ItemType Directory -Path $build -Force | Out-Null
try {
    $command = 'call "{0}" >nul && cl /nologo /W4 /O2 /MD /LD /I"{1}\include" "{2}\{4}.c" /Fo"{3}\console.obj" /link /LIBPATH:"{1}\bin" libswipl.lib /OUT:"{3}\{4}.dll" /IMPLIB:"{3}\console.lib"' -f $vcvars,$swiHome,$root,$build,$stem
    & $env:ComSpec /d /s /c $command
    if ($LASTEXITCODE -ne 0) { throw "Native console adapter build failed ($LASTEXITCODE)." }
    Copy-Item (Join-Path $build ($stem + '.dll')) (Join-Path $root ($stem + '.dll')) -Force
} finally {
    Remove-Item -LiteralPath $build -Recurse -Force
}
