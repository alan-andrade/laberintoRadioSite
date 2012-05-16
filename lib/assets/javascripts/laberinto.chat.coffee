window.Laberinto ||= {}

Laberinto.version = '1.0'

Chat = Laberinto.Chat = (options) ->
  this.inputbox   = options.inputbox
  this.container  = options.container
  this.socket     = io.connect options.socket_addr
  this.msg        = new Message()
  this.listen() if this.socket
  return

_.extend(Chat.prototype, {
  print: ->
    this.container.append this.msg.build()

  listen: ->
    chat = this
    this.socket.on 'new_connection', (data) ->
      chat.msg.set _.extend data, {class:'notice'}
      chat.print()
})

Message = (content={}) ->
  this.attributes = {}
  this.class      = content.class || 'message'
  this.tag        = 'tr'
  this.attributes['body']   = content.body
  this.attributes['sender'] = content.sender
  return

_.extend(Message.prototype, {
  set: (attributes) ->
    _.extend this.attributes, attributes

  get: (attribute) ->
    this.attributes[attribute]

  el: ->
    $(document.createElement this.tag)

  build: ->
    this.el().addClass(this.class)
    if this.class is 'message'
      return this.build_message()
    else
      return this.build_notice()

  build_message: ->
    sender = $('<td>').addClass('nickname').text(this.get 'sender')
    body   = $('<td>').addClass('body').text(this.get 'body')
    this.el().append(sender, body)

  build_notice: ->
    body  = $('<td>').attr('colspan','2').addClass(this.class).text(this.get 'body')
    this.el().append(body)
})
