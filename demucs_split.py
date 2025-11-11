import argparse, os, subprocess, sys

def run_demucs(inp, outdir, model):
    os.makedirs(outdir, exist_ok=True)
    cmd = ["python", "-m", "demucs.separate", "-n", model, "-o", outdir, inp]
    subprocess.check_call(cmd)

if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("-i", "--input", required=True)
    p.add_argument("-o", "--outdir", default="stems")
    p.add_argument("-m", "--model", default="htdemucs")
    a = p.parse_args()
    run_demucs(a.input, a.outdir, a.model)
