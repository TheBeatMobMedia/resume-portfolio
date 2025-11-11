# Getting Started on Android (Termux)

1. Install Termux from F-Droid.
2. Run `bash NoDAW_CLI_Android/termux_setup.sh`
3. Test binaries:
   ```bash
   ffmpeg -version
   sox --version
   python -c "import pedalboard; print('pedalboard ok')"
   ```
4. Run a chain:
   ```bash
   bash NoDAW_CLI_Android/chains/ffmpeg/screw_basic.sh "in.wav" out
   ```
