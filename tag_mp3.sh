#!/data/data/com.termux/files/usr/bin/bash
IN="$1"; ARTIST="$2"; TITLE="$3"; ALBUM="$4"; YEAR="$5"; BPM="$6"; KEY="$7"
python "$(dirname "$0")/../../python/tagger.py" -i "$IN" --artist "$ARTIST" --title "$TITLE" --album "$ALBUM" --year "$YEAR" --bpm "$BPM" --key "$KEY"
