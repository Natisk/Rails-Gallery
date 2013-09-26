$(document).ready ->

  $('textarea').keypress (event) ->
    if event.keyCode is 13 and not event.shiftKey
      $('form').submit()
      false

  pusher = new Pusher('b15da0d38e1cf270a7b1')
  channel = pusher.subscribe('test_channel')
  channel.bind "my_event", (data) ->
    alert data.message
