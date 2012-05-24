$ ->
  $('.play').click (e) ->
    e.preventDefault()
    soundManager.play 'stream'
    return
  $('.pause').click (e) ->
    e.preventDefault()
    soundManager.pause 'stream'
    return

soundManager.url = 'assets/sm/swf/'
soundManager.onready ->
  soundManager.createSound
    id: 'stream'
    url: 'http://neon.wavestreamer.com:6595/envivo'
