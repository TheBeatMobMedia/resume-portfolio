@echo off
set IN=%1
set OUTDIR=%2
if "%OUTDIR%"=="" set OUTDIR=out
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
for %%F in ("%IN%") do (
  sox "%%~fF" "%OUTDIR%\%%~nF_Dehum.wav" sinc -n 1024 60-62 118-122 178-182
)
