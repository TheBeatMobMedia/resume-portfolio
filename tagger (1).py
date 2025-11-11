import argparse
from mutagen.easyid3 import EasyID3
from mutagen.mp3 import MP3
def tag(path, artist, title, album, year, bpm, key):
    audio = MP3(path, ID3=EasyID3)
    audio['artist'] = artist
    audio['title'] = title
    if album: audio['album'] = album
    if year: audio['date'] = str(year)
    if bpm: audio['bpm'] = str(bpm)
    if key: audio['initialkey'] = key
    audio.save()
if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i","--input", required=True)
    ap.add_argument("--artist", required=True)
    ap.add_argument("--title", required=True)
    ap.add_argument("--album", default="")
    ap.add_argument("--year", default="")
    ap.add_argument("--bpm", default="")
    ap.add_argument("--key", default="")
    a = ap.parse_args()
    tag(a.input, a.artist, a.title, a.album, a.year, a.bpm, a.key)
    print("Tagged", a.input)
