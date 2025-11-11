@echo off
set IN=%1
set OUTDIR=%2
if "%OUTDIR%"=="" set OUTDIR=out
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
for %%F in ("%IN%") do (
  ffmpeg -y -i "%%~fF" -af "loudnorm=I=-14:TP=-1.0:LRA=11" "%OUTDIR%\%%~nF_-14LUFS.wav"
)
