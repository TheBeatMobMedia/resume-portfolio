# Getting Started on Windows

1. Install **FFmpeg**, **SoX**, **Rubberband**, and **Python 3.10+**. Add to PATH.
2. `pip install -r NoDAW_CLI_Windows/tools/requirements.txt`
3. Test:
   ```powershell
   ffmpeg -version
   sox --version
   python -c "import pedalboard; print('pedalboard ok')"
   ```
4. Run a chain:
   ```powershell
   .\chains\ffmpeg\denoise_voice.bat "in.wav" out
   ```
