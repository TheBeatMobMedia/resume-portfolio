# Pedalboard Cookbook

Use `NoDAW_CLI_Windows/tools/pedalboard_chain.py` with JSON configs. Example chain:

```json
{
  "chain": [
    {"HighpassFilter": {"cutoff_hz": 30.0}},
    {"Compressor": {"threshold_db": -18.0, "ratio": 3.0}},
    {"Gain": {"gain_db": 1.5}},
    {"Reverb": {"room_size": 0.15, "damping": 0.3, "wet_level": 0.08}},
    {"Limiter": {"threshold_db": -1.0}}
  ]
}
```
