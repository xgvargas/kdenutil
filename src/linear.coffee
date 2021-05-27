window.linearRun = ->
    flipX =                 document.getElementById('linearFlipX').checked
    flipY =                 document.getElementById('linearFlipY').checked
    reverse =               document.getElementById('linearReverse').checked
    offsetT =    parseFloat document.getElementById('linearOffsetTime').value
    offsetX =    parseFloat document.getElementById('linearOffsetX').value
    offsetY =    parseFloat document.getElementById('linearOffsetY').value
    gainT =      parseFloat document.getElementById('linearGainTime').value
    gainX =      parseFloat document.getElementById('linearGainX').value
    gainY =      parseFloat document.getElementById('linearGainY').value
    textarea =              document.getElementById('linearPoints')
    textareaOut =           document.getElementById('linearPointsOut')
    copy =                  document.getElementById('linearCopy').checked

    console.log 'flipX', flipX
    console.log 'flipY', flipY
    console.log 'reverse', reverse
    console.log 'offsetT', offsetT
    console.log 'offsetX', offsetX
    console.log 'offsetY', offsetY
    console.log 'gainT', gainT
    console.log 'gainX', gainX
    console.log 'gainY', gainY
    console.log 'textarea', textarea.value
    console.log 'copy', copy


    result = []
    minX = maxX = minY = maxY = minT = maxT = null

    points = textarea.value.split ';'

    for p in points

        # 0~=269 78 60 60 0       <--- auto mask
        # 1=267/75:60x60          <--- motion track

        m = p.match /^(\d+)~?=(-?[\d.]+)(?:\/|\s)(-?[\d.]+)/

        continue unless m

        if minX is null
            minT = +m[1]
            maxT = +m[1]
            minX = +m[2]
            maxX = +m[2]
            minY = +m[3]
            maxY = +m[3]

        minT = +m[1] if m[1] < minT
        maxT = +m[1] if m[1] > minT
        minX = +m[2] if m[2] < minX
        maxX = +m[2] if m[2] > minX
        minY = +m[3] if m[3] < minY
        maxY = +m[3] if m[3] > minY

    centerT = ((maxT - minT) / 2) + minT
    centerX = ((maxX - minX) / 2) + minX
    centerY = ((maxY - minY) / 2) + minY

    console.log minT, maxT, minX, maxX, minY, maxY, centerX, centerY

    for p in points

        # 0~=269 78 60 60 0       <--- auto mask
        # 1=267/75:60x60          <--- motion track

        m = p.match /^(\d+)~?=(-?[\d.]+)(?:\/|\s)(-?[\d.]+)/

        continue unless m

        t = +m[1]
        x = +m[2]
        y = +m[3]

        t = maxT - (t - minT) if reverse
        x = maxX - (x - minX) if flipX
        y = maxY - (y - minY) if flipY

        t = ((t - centerT) * gainT) + centerT
        x = ((x - centerX) * gainX) + centerX
        y = ((y - centerY) * gainY) + centerY

        t += offsetT
        x += offsetX
        y += offsetY

        result.push "#{t}~=#{x} #{y}"

    result.reverse() if reverse

    res = result.join ';'

    textareaOut.value = res

    copyToClipboard res if copy

    return
