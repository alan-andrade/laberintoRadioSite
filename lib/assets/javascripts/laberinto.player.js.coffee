$ ->
  $('.play').click ->
    soundManager.play 'stream'
  $('.pause').click ->
    soundManager.pause 'stream'
  #$('.wait').hide()
  #$('.jplayer').jPlayer({
    #ready: ->
      #$(this).jPlayer( 'setMedia' , {
        #'mp3' : 'http://70.38.54.111:9032/;stream/1'
      #})
      #return
    #cssSelectorAncestor: '.player'
    #cssSelector: {
      #play:   '.play'
      #pause:  '.pause'
    #}
    #errorAlerts: true
    #supplied: 'mp3'
    #solution: 'flash,html'
    #swfPath: 'assets/jPlayer/'
    #preload: 'none'
    #volume: 1
    #mode: 'window'

    #waiting: ->
      #$('.play i')
        #.removeClass('icon-play')
        #.addClass('icon-time')
      #$('.pause i')
        #.removeClass('icon-pause')
        #.addClass('icon-time')
      #return
    #playing: ->
      #$('.play i').addClass('icon-play')
      #$('.pause i').addClass('icon-pause')
      #return
  #})
  #return
soundManager.url = 'assets/sm/swf/'
soundManager.onready ->
  # SM2 has loaded - now you can create and play sounds!
  soundManager.createSound
    id: 'stream'
    url: 'http://neon.wavestreamer.com:6595/'
    autoload: true
    autoplay: true
