#!/data/data/com.termux/files/usr/bin/bash
set -e
pkg update -y && pkg upgrade -y
pkg install -y ffmpeg sox rubberband python git
pip install --upgrade pip
pip install pedalboard==0.7.7 mutagen==1.47.0 librosa==0.11.0 tqdm==4.66.4 demucs==4.0.0
echo "Termux NoDAW setup complete"
