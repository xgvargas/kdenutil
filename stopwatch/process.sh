#!/bin/bash

##################################
##################################
##################################

# somando 0.5 pode resolver o problem de arredondar pra CIMA

#### fontes:
# Ani            - sete segmentos
# ubuntu mono    - melhor

##################################
##################################
##################################



seconds=60
fps=30
full=false
font="ubuntu mono"



start=0
end=$(bc <<< "scale=0; $fps * $seconds + 1")

spf=$(bc <<< "scale=12; 1/$fps")

echo 'SPF:' $spf $start $end


for f in $(seq $start $end); do
    c=$(bc <<< "scale=12; $f * $spf ")
    h=$(bc <<< "scale=0; $c / (60*60)")
    m=$(bc <<< "scale=0; ($c / 60) % 60")
    s=$(bc <<< "scale=0; ($c / 1) % 60")
    ms=$(bc <<< "scale=0; ((($c) * 1000) / 1) % 1000")
    # echo $f '->' $c $h $m $s $ms

    if [ $full = true ]; then
        txt="$(printf '%d' $h):$(printf '%02d' $m):$(printf '%02d' $s).$(printf '%03d' $ms)"
    else
        if (( h > 0 )); then
            txt="$(printf '%d' $h):$(printf '%02d' $m):$(printf '%02d' $s).$(printf '%03d' $ms)"
        elif (( m > 0 )); then
                                txt="$(printf '%d' $m):$(printf '%02d' $s).$(printf '%03d' $ms)"
        else
                                                    txt="$(printf '%d' $s).$(printf '%03d' $ms)"
        fi
    fi

    echo $f $txt

    sed "s/00:00:00.000/$txt/" stopwatch.svg > _tmp.svg

    inkscape -o /tmp/frame-$(printf '%05d' $f).png _tmp.svg &> /dev/null
done

ffmpeg -framerate $fps -i /tmp/frame-%05d.png "stopwatch-${fps//./_}fps-${seconds}secs-${font// /_}".mp4

rm /tmp/frame-*.png
