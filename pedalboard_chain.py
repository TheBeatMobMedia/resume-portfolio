import argparse, json, os
from pedalboard import Pedalboard, HighpassFilter, LowpassFilter, Compressor, Gain, Limiter, Reverb, HighShelfFilter, LowShelfFilter, Chorus, Delay, Distortion, LadderFilter, Phaser, Convolution
from pedalboard.io import AudioFile

PLUGINS = {
    "HighpassFilter": HighpassFilter,
    "LowpassFilter": LowpassFilter,
    "Compressor": Compressor,
    "Gain": Gain,
    "Limiter": Limiter,
    "Reverb": Reverb,
    "HighShelfFilter": HighShelfFilter,
    "LowShelfFilter": LowShelfFilter,
    "Chorus": Chorus,
    "Delay": Delay,
    "Distortion": Distortion,
    "LadderFilter": LadderFilter,
    "Phaser": Phaser,
    "Convolution": Convolution
}

def run_chain(inp, cfg_path, outdir):
    os.makedirs(outdir, exist_ok=True)
    with open(cfg_path, "r", encoding="utf-8") as f:
        cfg = json.load(f)
    chain = []
    for step in cfg.get("chain", []):
        name, params = list(step.items())[0]
        cls = PLUGINS.get(name)
        if not cls:
            raise ValueError(f"Unknown plugin {name}")
        chain.append(cls(**params))
    board = Pedalboard(chain)
    basename = os.path.splitext(os.path.basename(inp))[0]
    out = os.path.join(outdir, f"{basename}_PB.wav")
    with AudioFile(inp, 'r') as f:
        audio = f.read(f.frames)
        sr = f.samplerate
    effected = board(audio, sr)
    with AudioFile(out, 'w', samplerate=sr, num_channels=audio.shape[0]) as f:
        f.write(effected)
    print("Wrote", out)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--input", required=True)
    ap.add_argument("-c", "--config", required=True)
    ap.add_argument("-o", "--outdir", default="out")
    args = ap.parse_args()
    run_chain(args.input, args.config, args.outdir)
