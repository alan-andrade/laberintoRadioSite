window.Laberinto ||= {}

Laberinto.version = '1.0'

Chat = Laberinto.Chat = (options) ->
  this.inputbox   = options.inputbox
  this.container  = options.container
  this.socket     = io.connect options.socket_addr

  this.socket.on 'new_connection', (data) =>
    this.nickname = data.nickname
    this.trigger 'a'
  return

_.extend(Chat.prototype, {

})
