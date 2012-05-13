window.Laberinto ||= {}

Laberinto.ChatRoom = Backbone.View.extend {
  el: '#messages-container table tbody'

  appendMessage: (message) ->
    this.$el.prepend message.render()
}

Laberinto.Message = Backbone.View.extend {
  tagName: 'tr'
  initialize: ->
    this.template = _.template "<td class='nickname'><%= nickname %></td>"+
                               "<td class='message'><%= message %></td>"
    return
  render: ->
    this.$el.append this.template(this.options)
}
