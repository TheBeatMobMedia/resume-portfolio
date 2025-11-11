@echo off
set IN=%1
set OUTDIR=%2
if "%OUTDIR%"=="" set OUTDIR=out
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
for %%F in ("%IN%") do (
  ffmpeg -y -i "%%~fF" -filter:a "asetrate=44100*0.85,aresample=44100,atempo=1.0" "%OUTDIR%\%%~nF_Screw85.wav"
)
