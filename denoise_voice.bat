@echo off
set IN=%1
set OUTDIR=%2
if "%OUTDIR%"=="" set OUTDIR=out
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
for %%F in ("%IN%") do (
  ffmpeg -y -i "%%~fF" -af "afftdn=nf=-25, lowpass=f=12000, highpass=f=60" "%OUTDIR%\%%~nF_Denoise.wav"
)
