addMsgToTable = (msg) ->
  if msg.nickname is undefined
    msg.nickname = 'Yo'

  console.log msg
  tableBody = $('.table tbody')

  tr = $('<tr>')

  $('<td>').text(msg.nickname).appendTo tr
  $('<td>').text(msg.msg).appendTo tr

  tr.appendTo tableBody
  $('#chat').animate {scrollTop: tableBody.height()}
  return

# socket.IO

socket = io.connect 'http://localhost:8080'
socket.on 'postMsg', (data) ->
  console.log data
  addMsgToTable(data)
  return

$ ->
  $('.sendMyMsg').click (e) ->
    e.preventDefault()
    myMsg = $('.myMsg')
    if myMsg.val() is ""
      console.log 'tooltip'
    else
      socket.emit 'msg', { msg: myMsg.val() }
      addMsgToTable({msg: myMsg.val()})
      myMsg.val('')
    return

  return
