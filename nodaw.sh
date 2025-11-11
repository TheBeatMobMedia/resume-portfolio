#!/data/data/com.termux/files/usr/bin/bash
CMD="$1"; IN="$2"; OUT="${3:-out}"
mkdir -p "$OUT"
case "$CMD" in
  screw-basic) bash "$(dirname "$0")/chains/ffmpeg/screw_basic.sh" "$IN" "$OUT" ;;
  denoise-voice) bash "$(dirname "$0")/chains/ffmpeg/denoise_voice.sh" "$IN" "$OUT" ;;
  loudnorm-14) bash "$(dirname "$0")/chains/ffmpeg/loudnorm_14.sh" "$IN" "$OUT" ;;
  pedalboard) python "$(dirname "$0")/python/pedalboard_chain.py" -i "$IN" -c "$4" -o "$OUT" ;;
  demucs) python "$(dirname "$0")/python/demucs_split.py" -i "$IN" -o "$OUT" ;;
  *) echo "NoDAW CLI (Android)"; echo "Usage: nodaw.sh <cmd> <input> <outdir>";;
esac
