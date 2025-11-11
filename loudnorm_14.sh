#!/data/data/com.termux/files/usr/bin/bash
IN="$1"; OUTDIR="${2:-out}"; mkdir -p "$OUTDIR"
ffmpeg -y -i "$IN" -af "loudnorm=I=-14:TP=-1.0:LRA=11" "$OUTDIR/$(basename "${IN%.*}")_-14LUFS.wav"
