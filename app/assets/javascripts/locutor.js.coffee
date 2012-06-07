
LR = window.LR = {}

###
Google Gauge to indicate listeners quantity.
###

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

  @setValue: ( val ) ->
    @data.setValue( 0, 0, val )
    @redraw()

  @getValue: ->
    @data.getValue( 0, 0 )


###
  Shoutcast interface to query and integrate with google Gauge and google Map
###

class LR.Shoutcast
  @Gauge      = LR.Gauge
  @listeners  = []

  @getListeners : ->
    $.ajax
      url: '/listeners'
      complete: ->
      success:  LR.Shoutcast.handlers.success
      error:    ->

  @poll: ( action ) ->
    switch action
      when 'start'
        @polling = setInterval @getListeners, 10000
      when 'stop'
        clearInterval @polling

  @handlers:
    success: ( response ) ->
      LR.Shoutcast.cleanResponse  ( response )
      LR.Shoutcast.updateGauge    ( LR.Shoutcast.listeners.length )
      LR.Map.update               ( LR.Shoutcast.listeners )

  @updateGauge: ( listeners ) ->
    @Gauge.setValue( listeners )

  @cleanResponse: ( response ) =>
    listeners = response.SHOUTCASTSERVER.LISTENERS
    if listeners is null
      listeners = []
    else
      if listeners.LISTENER.length is undefined
        @listeners = [listeners.LISTENER] # 1 listener
      else
        @listeners =  listeners.LISTENER # more than 1 listener

###
  Google Map for pinning the new listeners.
###

class LR.Map
  @element: ->
    $('.lr.map').get(0)

  @markers: []
  @cleanMarkers: ->
    for marker in @markers
      marker.setMap(null)
    @markers = []

  @options:
    mapTypeId: google.maps.MapTypeId.ROADMAP
    center: new google.maps.LatLng(23, -102)
    zoom: 4

  @draw: ->
    @map = new google.maps.Map( @element() , @options )
    return

  @update: ( listeners ) ->
    @cleanMarkers()
    for listener in listeners
      LR.IPtrans.translate( listener.HOSTNAME, LR.Map.drawMarker )

  @drawMarker: ( ipAsCoords ) =>
    lat = parseFloat(ipAsCoords.latitude)
    lng = parseFloat(ipAsCoords.longitude)
    position  = new google.maps.LatLng lat, lng
    marker    = new google.maps.Marker
      animation : google.maps.Animation.BOUNCE
      position  : position
      map       : @map
    @markers.push marker
    return

###
  IP Geolocalization
###

class LR.IPtrans
  @translate: ( ip, callback ) ->
    $.ajax
      url: "http://freegeoip.net/json/#{ip}"
      success: callback

$ ->

  $('.lr.stop').click -> LR.Shoutcast.poll('stop')

  LR.Gauge.draw()
  LR.Shoutcast.poll('start')
  LR.Map.draw()
  return
