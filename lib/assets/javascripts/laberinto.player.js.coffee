$ ->
  $('.play').click ->
    soundManager.play 'stream'
  $('.pause').click ->
    soundManager.pause 'stream'

soundManager.url = 'assets/sm/swf/'
soundManager.onready ->
  soundManager.createSound
    id: 'stream'
    url: 'http://neon.wavestreamer.com:6595/'
