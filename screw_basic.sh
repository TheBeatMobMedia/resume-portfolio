#!/data/data/com.termux/files/usr/bin/bash
IN="$1"; OUTDIR="${2:-out}"; mkdir -p "$OUTDIR"
ffmpeg -y -i "$IN" -filter:a "asetrate=44100*0.85,aresample=44100,atempo=1.0" "$OUTDIR/$(basename "${IN%.*}")_Screw85.wav"
