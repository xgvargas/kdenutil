window.copyToClipboard = (txt) ->
    input = document.getElementById('libAuxInput')

    input.value = txt
    input.type = 'text'
    input.select()
    document.execCommand 'copy'
    input.type = 'hidden'

    console.log 'copied:', txt
