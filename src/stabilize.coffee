window.stabilizeRun = ->
    console.log "funciona!!!!"
    posX =   parseFloat document.getElementById('stabilizeX').value
    posY =   parseFloat document.getElementById('stabilizeY').value
    motion = document.getElementById('stabilizeMotion').checked
    mask =   document.getElementById('stabilizeMask').checked
    keep =   document.getElementById('stabilizeKeep').checked
    move =   document.getElementById('stabilizeMove').checked
    original = document.getElementById('stabilizePoints').value

    console.log 'posX', posX
    console.log 'posY', posY
    console.log 'motion', motion
    console.log 'mask', mask
    console.log 'keep', keep
    console.log 'move', move
    console.log 'original', original

    points = original.split ';'

    result = []
    start = null

    for p in points
        # 115~=200.903 99.9878 64.9459 64.9459 0   <--- auto mask
        # 16=259.611/62.6111:60x60                 <--- motion track

        m = p.match /^(\d+)~?=([\d.]+)(?:\/|\s)([\d.]+)/

        continue unless m

        if keep
            unless start
                start = [m[2], m[3]]

            x = start[0] - m[2]
            y = start[1] - m[3]

        else
            x = posX - m[2]
            y = posY - m[3]

        if motion
            r = "#{m[1]}~=#{x} #{y}"
        else
            r = "#{m[1]}=#{x}/#{y}"

        result.push r

    final = result.join ';'

    console.log final
    return







document.getElementById('stabilizePoints').value = '268/76:60x60:0;1=268/76:60x60;2=268.111/76.6667:60x60;3=268.778/77.6667:60x60;4=272.111/79.3333:60x60;5=272.444/79.3333:60x60;6=273/79.3333:60x60;7=273.5/79.8333:60x60;8=274/80:60x60;9=275/78.1667:60x60;10=277.167/73.8333:60x60;11=277.611/72.8333:60x60;12=276.5/71.3889:60x60;13=272.722/69.8333:60x60;14=269.278/69.8333:60x60;15=264.833/68.8333:60x60;16=259.611/62.6111:60x60;17=259.611/61.7778:60x60;18=257.611/61.4444:60x60;19=253.611/61.4444:60x60;20=249.722/61.6667:60x60;21=246.833/62.6667:60x60;22=244.833/64.2222:60x60;23=244.722/64.5555:60x60;24=245.611/64.4444:60x60;25=247.278/64.2222:60x60;26=249.722/64.4444:60x60'
