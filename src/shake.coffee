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

window.shakeSetTemplate = ->
    type = document.getElementById('shakeTemplate').value
    console.log 'shake, setting:', type
    for i in [0...3]
        for p, v of templates[type][i]
            document.getElementById("shake#{i + 1}_#{p}").value = v


window.shakeSetTemplate()


window.shakeRun = ->
    console.log "funciona!!!!"
