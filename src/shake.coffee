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
    type =         document.getElementById('shakeTemplate').value
    textareaOut =  document.getElementById('shakePointsOut')
    copy =         document.getElementById('shakeCopy').checked

    console.log 'type', type
    console.log 'copy', copy

    return


###

[
    {
        "in": 0,
        "max": 360,
        "min": -360,
        "name": "rotation",
        "out": 520,
        "type": 10,
        "value": "0=0;82=-11;160~=11"
    },
    {
        "in": 0,
        "max": 0,
        "min": 0,
        "name": "rect",
        "out": 520,
        "type": 7,
        "value": "0=0 0 640 360 1.000000;82=347 28 279 149 1.000000;160~=24 164 279 149 0.560000"
    }
]


0=0 0 640 360 1.000000;82=347 28 279 149 1.000000;160~=24 164 279 149 0.560000


###
