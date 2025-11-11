@echo off
REM Usage: tag_mp3.bat "input.mp3" Artist Title Album Year BPM Key
set IN=%1
set ARTIST=%2
set TITLE=%3
set ALBUM=%4
set YEAR=%5
set BPM=%6
set KEY=%7
python "%~dp0..\..\tools\tagger.py" -i "%IN%" --artist "%ARTIST%" --title "%TITLE%" --album "%ALBUM%" --year "%YEAR%" --bpm "%BPM%" --key "%KEY%"
