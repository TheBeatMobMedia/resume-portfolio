import argparse, librosa, json, os
def detect(path):
    y, sr = librosa.load(path, mono=True)
    tempo, beats = librosa.beat.beat_track(y=y, sr=sr)
    chroma = librosa.feature.chroma_cqt(y=y, sr=sr)
    key_idx = chroma.mean(axis=1).argmax()
    KEYS = ['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
    return float(tempo), KEYS[key_idx]
if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i","--input", required=True)
    ap.add_argument("-o","--out", default=None)
    args = ap.parse_args()
    tempo, key = detect(args.input)
    data = {"bpm": round(tempo,2), "key": key}
    if args.out:
        with open(args.out,"w") as f: json.dump(data,f,indent=2)
    print(json.dumps(data))
