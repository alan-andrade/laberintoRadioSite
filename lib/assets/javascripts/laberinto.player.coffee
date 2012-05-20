$ ->
  $('.wait').hide()
  $('.jplayer').jPlayer({
    swfPath: 'assets/jPlayer/'
    volume: 1
    cssSelectorAncestor: '.player'
    cssSelector: {
      play: '.play'
      pause: '.pause'
    }
    wmode: 'window'
    ready: ->
      $(this).jPlayer( 'setMedia' , {
        'mp3' : 'http://hobbes.idobi.com/;stream.mp3'
        'poster' : 'http://idobi.com/wp-content/themes/idobi-2011/images/header.jpg'
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
