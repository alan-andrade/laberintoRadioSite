# Require google api before.
LR = window.LR = {}

class LR.Gauge

  google.load( 'visualization', '1', { packages: [ 'gauge' ] })

  @element: ->
    $('.lr.chart').get(0)

  @options:
    max: 50,
    width:  500,
    height: 220,
    minorTicks: 10

  @draw: ->
    @chart  = new google.visualization.Gauge @element()
    @data   = new google.visualization.arrayToDataTable [['Listeners'],[0]]
    @chart.draw( @data, @options )

  @redraw: ->
    @chart.draw @data, @options

  @change: ( val ) ->
    @data.setValue( 0, 0, val )
    @redraw()

  @getValue: ->
    @data.getValue( 0, 0 )

class LR.Shoutcast
  @Gauge = LR.Gauge

  @setup: ->
    $.ajaxSetup
      url: '/listeners'
      complete: ->
      success:  @handlers.success
      error:    ->

  @poll: ( action ) ->
    switch action
      when 'start'
        @setup()
        @polling = setInterval $.ajax, 10000
      when 'stop'
        clearInterval @polling

  @handlers:
    success: ( data ) ->
      console.log data

$ ->

  $('.lr.up').click   -> LR.Gauge.change( LR.Gauge.getValue() + 1 )
  $('.lr.down').click -> LR.Gauge.change( LR.Gauge.getValue() - 1 )
  $('.lr.stop').click -> LR.Shoutcast.poll('stop')

  LR.Gauge.draw()
  LR.Shoutcast.poll 'start'
  return
