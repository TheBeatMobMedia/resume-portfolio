sox "$1" "$2/$(basename "${1%.*}")_Dehum.wav" sinc -n 1024 60-62 118-122 178-182
