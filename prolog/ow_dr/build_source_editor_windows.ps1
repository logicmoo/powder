param([string]$Swipl = 'swipl.exe')
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$swiHome = Split-Path (Split-Path (Get-Command $Swipl -ErrorAction Stop).Source -Parent) -Parent
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
$vcvars = & $vswhere -latest -products '*' -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -find 'VC\Auxiliary\Build\vcvars64.bat'
if (-not $vcvars) { throw 'Visual C++ x64 Build Tools are required.' }
$env:Path = (Split-Path $vswhere -Parent) + ';' + $env:Path
$build = Join-Path $root '.source-editor-build'
New-Item -ItemType Directory -Path $build -Force | Out-Null
try {
    $command = 'call "{0}" >nul && cl /nologo /W4 /O2 /MD /LD /I"{1}\include" "{2}\kb_source_editor_windows.c" /Fo"{3}\editor.obj" /link /LIBPATH:"{1}\bin" libswipl.lib advapi32.lib /OUT:"{3}\kb_source_editor_windows.dll" /IMPLIB:"{3}\editor.lib"' -f $vcvars,$swiHome,$root,$build
    & $env:ComSpec /d /s /c $command
    if ($LASTEXITCODE -ne 0) { throw "Native editor build failed ($LASTEXITCODE)." }
    Copy-Item (Join-Path $build 'kb_source_editor_windows.dll') $root -Force
} finally {
    Remove-Item -LiteralPath $build -Recurse -Force
}
