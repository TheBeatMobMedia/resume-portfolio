param(
  [Parameter(Position=0)][string]$Command = "--help",
  [Parameter(Position=1)][string]$InputPath = "",
  [Parameter(Position=2)][string]$OutDir = "out"
)

if ($Command -eq "--help") {
  Write-Host "NoDAW CLI (Windows)"
  Write-Host "Usage:"
  Write-Host "  nodaw.ps1 screw-basic <input> <outdir>"
  Write-Host "  nodaw.ps1 denoise-voice <input> <outdir>"
  Write-Host "  nodaw.ps1 loudnorm-14 <input> <outdir>"
  Write-Host "  nodaw.ps1 demucs <input> <outdir>"
  Write-Host "  nodaw.ps1 pedalboard <input> <config.json> <outdir>"
  exit 0
}

if (!(Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir | Out-Null }

switch ($Command) {
  "screw-basic" { & ".\chains\ffmpeg\screw_basic.bat" $InputPath $OutDir }
  "denoise-voice" { & ".\chains\ffmpeg\denoise_voice.bat" $InputPath $OutDir }
  "loudnorm-14" { & ".\chains\ffmpeg\loudnorm_14.bat" $InputPath $OutDir }
  "demucs" { python ".\tools\demucs_split.py" -i $InputPath -o $OutDir }
  "pedalboard" {
      param([string]$Cfg = $args[0])
      python ".\tools\pedalboard_chain.py" -i $InputPath -c $Cfg -o $OutDir
  }
  default { Write-Host "Unknown command. Use --help" }
}
