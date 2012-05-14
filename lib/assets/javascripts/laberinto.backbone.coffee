window.Laberinto ||= {}

Laberinto.Chat = Backbone.View.extend {
  initialize: ->
    this.socket = this.options.socket
    this.tbody  = this.options.container
    this.socket.on 'receive_message', (data) =>
      this.receive_message data

  el: '.chat'

  events: { 'submit' : 'submit_message' }

  submit_message: ->
    input = this.options.inputbox
    body  = input.val()
    return false if body is ''
    this.socket.emit 'client_message' , { body: body }
    input.val('')
    false

  receive_message: (data) ->
    message     = new Message data
    messageView = new MessageView { model: message }
    this.tbody.prepend messageView.render()
}

# MESSAGE

Message = Backbone.Model

MessageView = Backbone.View.extend {
  tagName: 'tr'
  template: _.template "<td class='nickname'><%= nickname %></td>"+
                       "<td class='message'><%= body %></td>"
  render: ->
    this.$el.append this.template({ nickname: this.model.get('nickname') , body: this.model.get('body')} )
}
