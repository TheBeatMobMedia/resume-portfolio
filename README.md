# MyAiPlug (TM): NoDAW Studio - Complete Package v0.9

This bundle includes:
- **NoDAW Studio Bible** (Markdown chapters)
- **NoDAW CLI for Windows** (.bat + .ps1)
- **NoDAW CLI for Android** (Termux .sh)
- **Audio Alchemy** presets and field guide
- **Python utilities** for Pedalboard, Demucs, BPM/Key, and tagging

## Quick Start

### Windows
1) Install: Python 3.10+, FFmpeg, SoX, Rubberband. Add them to PATH.
2) Open PowerShell in `NoDAW_CLI_Windows` and run:
   ```powershell
   .\bin\nodaw.ps1 --help
   ```
3) Try a chain:
   ```powershell
   .\chains\ffmpeg\screw_basic.bat "input.wav" outdir
   ```

### Android (Termux)
1) Install Termux from F-Droid. Open, then run:
   ```bash
   bash ~/NoDAW_Complete_Package/NoDAW_CLI_Android/termux_setup.sh
   ```
2) Use the launcher:
   ```bash
   bash ~/NoDAW_Complete_Package/NoDAW_CLI_Android/nodaw.sh --help
   ```

All scripts are **self contained**. Edit chains as needed. Avoid spaces in paths when possible.
