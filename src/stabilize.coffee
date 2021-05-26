window.stabilizeRun = ->
    posX =   parseFloat document.getElementById('stabilizeX').value
    posY =   parseFloat document.getElementById('stabilizeY').value
    keep =   document.getElementById('stabilizeKeep').checked
    move =   document.getElementById('stabilizeMove').checked
    textarea = document.getElementById('stabilizePoints')

    console.log 'posX', posX
    console.log 'posY', posY
    console.log 'keep', keep
    console.log 'move', move
    console.log 'original', textarea.value

    result = []
    centerX = centerY = null

    points = textarea.value.split ';'

    for p in points

        # 0~=269 78 60 60 0       <--- auto mask
        # 1=267/75:60x60          <--- motion track

        m = p.match /^(\d+)~?=([\d.]+)(?:\/|\s)([\d.]+)/

        continue unless m

        if centerX is null
            if move
                m = p.match /^(\d+)~?=([\d.]+)(?:\/|\s)([\d.]+)(?::|\s)([\d.]+)(?:x|\s)([\d.]+)/
                centerX = posX - m[4]/2
                centerY = posY - m[5]/2

            if keep
                centerX = m[2]
                centerY = m[3]

        result.push "#{m[1]}~=#{centerX - m[2]} #{centerY - m[3]}"

    textarea.value = result.join ';'
    textarea.select()
    document.execCommand 'copy'

    return
