$ ->
  $('.wait').hide()
  $('.jplayer').jPlayer({
    swfPath: 'assets/jPlayer/'
    supplied: 'mp3'
    solution: 'flash,html'
    errorAlerts: true
    volume: 1
    cssSelectorAncestor: '.player'
    cssSelector: {
      play: '.play'
      pause: '.pause'
    }
    ready: ->
      $(this).jPlayer( 'setMedia' , {
        'mp3' : 'http://70.38.54.111:9032/;stream/1'
      })

    waiting: ->
      $('.play i')
        .removeClass('icon-play')
        .addClass('icon-time')
      $('.pause i')
        .removeClass('icon-pause')
        .addClass('icon-time')
    playing: ->
      $('.play i').addClass('icon-play')
      $('.pause i').addClass('icon-pause')
  })
