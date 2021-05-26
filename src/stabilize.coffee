window.stabilizeRun = ->
    console.log "funciona!!!!"
    width =  parseFloat document.getElementById('stabilizeWidth').value
    height = parseFloat document.getElementById('stabilizeHeight').value
    x =      parseFloat document.getElementById('stabilizeX').value
    y =      parseFloat document.getElementById('stabilizeY').value
    motion = document.getElementById('stabilizeMotion').checked
    mask =   document.getElementById('stabilizeMask').checked
    points = document.getElementById('stabilizePoints').value

    console.log 'width', width
    console.log 'height', height
    console.log 'x', x
    console.log 'y', y
    console.log 'motion', motion
    console.log 'mask', mask
    console.log 'points', points

    return
