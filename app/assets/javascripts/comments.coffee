$(document).ready ->

  $("textarea").keypress (event) ->
    if event.keyCode is 13 and not event.shiftKey
      $('form').submit()
      false
