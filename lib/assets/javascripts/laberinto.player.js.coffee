$ ->
  $('.jplayer').jPlayer
    ready: ->
      $(this).jPlayer 'setMedia',
        mp3: 'http://neon.wavestreamer.com:6595/;stream/1'
      return
    swfPath: 'assets/jquery.jplayer/'
    solution: 'flash,html'
    supplied: 'mp3'
    preload: 'none'
    cssSelectorAncestor: '.jaudio'
    cssSelector:
      play: '.play'
      pause: '.pause'
      noSolution: '.no-solution'
  return
