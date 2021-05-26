templates = {
    Normal: [
        {Peak: 1, Freq: 2, Noise: 3}
        {Peak: 4, Freq: 5, Noise: 6}
        {Peak: 7, Freq: 8, Noise: 9}]
    Parkinson: [
        {Peak: 12, Freq: 8, Noise: .6}
        {Peak: 12, Freq: 8, Noise: .6}
        {Peak: 12, Freq: 8, Noise: .6}]
    Light: [
        {Peak: 2, Freq: 1, Noise: .2}
        {Peak: 2, Freq: 1, Noise: .2}
        {Peak: 2, Freq: 1, Noise: .2}]
}

window.shakerSetTemplate = ->
    type = document.getElementById('shakerTemplate').value
    console.log 'shaker, setting:', type
    for i in [0...3]
        for p, v of templates[type][i]
            document.getElementById("shaker#{i + 1}_#{p}").value = v


window.shakerSetTemplate()


window.shakerRun = ->
    console.log "funciona!!!!"
