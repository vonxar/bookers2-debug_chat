document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#chats').data('room_id') },
    connected: ->

    disconnected: ->

    received: (data) ->
      console.log('test')
      $('#chats').append data['chat']

    speak: (chat) ->
      console.log(chat)
      @perform 'speak', chat: chat

  $('#chat-input').on 'keypress', (event) ->
    if event.keyCode is 13
      console.log('enter')
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()