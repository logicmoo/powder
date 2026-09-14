param([string]$Swipl = 'swipl.exe')
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$swiplPath = (Get-Command $Swipl -ErrorAction Stop).Source
$swiHome = Split-Path (Split-Path $swiplPath -Parent) -Parent
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (-not (Test-Path $vswhere)) { throw 'Visual C++ Build Tools are required for the optional native path guard.' }
$vcvars = & $vswhere -latest -products '*' -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -find 'VC\Auxiliary\Build\vcvars64.bat'
if (-not $vcvars) { throw 'The installed Visual Studio has no x64 C++ Build Tools.' }
$env:Path = (Split-Path $vswhere -Parent) + ';' + $env:Path
$build = Join-Path $root ('.llm-paths-build-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $build -Force | Out-Null
try {
    $command = 'call "{0}" >nul && cl /nologo /W4 /O2 /MD /LD /I"{1}\include" "{2}\kb_llm_paths_windows.c" /Fo"{3}\paths.obj" /link /LIBPATH:"{1}\bin" libswipl.lib /OUT:"{3}\kb_llm_paths_windows.dll" /IMPLIB:"{3}\paths.lib"' -f $vcvars,$swiHome,$root,$build
    & $env:ComSpec /d /s /c $command
    if ($LASTEXITCODE -ne 0) { throw "Native path guard build failed ($LASTEXITCODE)." }
    Copy-Item (Join-Path $build 'kb_llm_paths_windows.dll') (Join-Path $root 'kb_llm_paths_windows.dll') -Force
} finally {
    Remove-Item -LiteralPath $build -Recurse -Force
}
