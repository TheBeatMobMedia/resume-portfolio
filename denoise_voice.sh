#!/data/data/com.termux/files/usr/bin/bash
IN="$1"; OUTDIR="${2:-out}"; mkdir -p "$OUTDIR"
ffmpeg -y -i "$IN" -af "afftdn=nf=-25, lowpass=f=12000, highpass=f=60" "$OUTDIR/$(basename "${IN%.*}")_Denoise.wav"
