# SoX Cookbook (Selected)

## Dehum 60 Hz
```
sox INPUT OUTPUT sinc -n 1024 60-62 118-122 178-182
```

## De-ess
```
sox INPUT OUTPUT compand 0.1,0.2 -60,-60,-20,-10,-6,-6 0 -6 44100:44100
```

## Trim silence
```
sox INPUT OUTPUT silence 1 0.1 1% reverse silence 1 0.1 1% reverse
```
