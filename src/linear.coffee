window.linearRun = ->
    flipX =         document.getElementById('linearFlipX').checked
    flipY =         document.getElementById('linearFlipY').checked
    reverse =       document.getElementById('linearReverse').checked
    offsetX = parseFloat document.getElementById('linearOffsetX').value
    offsetY = parseFloat document.getElementById('linearOffsetY').value
    gainX = parseFloat document.getElementById('linearGainX').value
    gainY = parseFloat document.getElementById('linearGainY').value
    textarea =      document.getElementById('linearPoints')

    console.log 'flipX', flipX
    console.log 'flipY', flipY
    console.log 'reverse', reverse
    console.log 'offsetX', offsetX
    console.log 'offsetY', offsetY
    console.log 'gainX', gainX
    console.log 'gainY', gainY
    console.log 'textarea', textarea.value


    result = []
    minX = maxX = minY = maxY = minI = maxI = null

    points = textarea.value.split ';'

    for p in points

        # 0~=269 78 60 60 0       <--- auto mask
        # 1=267/75:60x60          <--- motion track

        m = p.match /^(\d+)~?=(-?[\d.]+)(?:\/|\s)(-?[\d.]+)/

        continue unless m

        if minX is null
            minI = +m[1]
            maxI = +m[1]
            minX = +m[2]
            maxX = +m[2]
            minY = +m[3]
            maxY = +m[3]

        minI = +m[1] if m[1] < minI
        maxI = +m[1] if m[1] > minI
        minX = +m[2] if m[2] < minX
        maxX = +m[2] if m[2] > minX
        minY = +m[3] if m[3] < minY
        maxY = +m[3] if m[3] > minY

    centerX = ((maxX - minX) / 2) + minX
    centerY = ((maxY - minY) / 2) + minY

    console.log minI, maxI, minX, maxX, minY, maxY, centerX, centerY

    for p in points

        # 0~=269 78 60 60 0       <--- auto mask
        # 1=267/75:60x60          <--- motion track

        m = p.match /^(\d+)~?=(-?[\d.]+)(?:\/|\s)(-?[\d.]+)/

        continue unless m

        i = +m[1]
        x = +m[2]
        y = +m[3]

        i = maxI - (i - minI) if reverse
        x = maxX - (x - minX) if flipX
        y = maxY - (y - minY) if flipY

        x = ((x - centerX) * gainX) + centerX
        y = ((y - centerY) * gainY) + centerY

        x += offsetX
        y += offsetY

        result.push "#{i}~=#{x} #{y}"

    result.reverse() if reverse

    textarea.value = result.join ';'
    # textarea.select()
    # document.execCommand 'copy'

    return
# 0=5 6;2=7 9;3=12 20
