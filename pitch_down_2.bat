@echo off
set IN=%1
set OUTDIR=%2
if "%OUTDIR%"=="" set OUTDIR=out
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
for %%F in ("%IN%") do (
  rubberband -p -2 "%%~fF" "%OUTDIR%\%%~nF_PitchDown2.wav"
)
