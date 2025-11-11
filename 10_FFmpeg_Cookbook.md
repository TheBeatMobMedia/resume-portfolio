# FFmpeg Cookbook (Selected)

## Screw (slow + pitch) classic
```
ffmpeg -y -i INPUT -filter:a "asetrate=44100*0.85,aresample=44100,atempo=1.0" OUTPUT
```

## Gentle high shelf polish
```
ffmpeg -y -i INPUT -filter:a "highshelf=f=8000:g=3:t=0.8" OUTPUT
```

## De-bleed voice (mid emphasis + side trim)
```
ffmpeg -y -i INPUT -af "channelsplit=channel_layout=stereo[FL][FR];[FL][FR]join=inputs=2:channel_layout=stereo,pan=stereo|c0=0.8*c0+0.2*c1|c1=0.8*c1+0.2*c0" OUTPUT
```

## Loudness to -14 LUFS approx
```
ffmpeg -y -i INPUT -af "loudnorm=I=-14:TP=-1.0:LRA=11" OUTPUT
```

## Old vinyl grime
```
ffmpeg -y -i INPUT -af "acompressor=threshold=-18dB:ratio=2.5:attack=8:release=120,aphaser=in_gain=0.8:out_gain=0.74:delay=2:decay=0.4:speed=0.5,anequalizer=f=240:t=q:w=1.1:g=3,anequalizer=f=5200:t=q:w=0.9:g=-2" OUTPUT
```

## Stereo widen subtle
```
ffmpeg -y -i INPUT -af "stereotools=mode=lr>ms:phase=1.02:surround=0.1" OUTPUT
```
