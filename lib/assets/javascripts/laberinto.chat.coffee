window.Laberinto ||= {}

Laberinto.version = '1.0'

Chat = Laberinto.Chat = (options) ->
  this.inputbox   = options.inputbox
  this.container  = options.container
  this.form       = options.form
  this.socket     = io.connect options.socket_addr
  this.msg        = new Message()
  this.listen() if this.socket

  this.form.on 'submit', =>
    text = this.inputbox.val()
    return false if text is ''
    this.msg.set { body: text, sender: 'Yo dije' , className: 'message'}
    this.print()
    this.socket.emit 'client_message', { body: this.inputbox.val() }
    this.inputbox.val ''
    false

  return

_.extend(Chat.prototype, {
  print: ->
    this.container.prepend this.msg.build()

  listen: ->
    chat = this
    this.socket.on 'new_connection', (data) ->
      chat.msg.set _.extend(data, { className:'notice'})
      console.log chat.msg
      chat.print()

    this.socket.on 'receive_message', (data) ->
      chat.msg.set _.extend(data, { className:'message' })
      console.log chat.msg
      chat.print()
})

Message = (content={}) ->
  this.attributes = {}
  this.tag        = 'tr'
  this.attributes['body']   = content.body
  this.attributes['sender'] = content.sender
  this.attributes['className']  = content.className || 'message'
  return

_.extend(Message.prototype, {
  set: (attributes) ->
    _.extend this.attributes, attributes

  get: (attribute) ->
    this.attributes[attribute]

  el: ->
    $(document.createElement this.tag)

  build: ->
    className = this.get 'className'
    this.el().addClass(className)
    if className == 'message'
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
