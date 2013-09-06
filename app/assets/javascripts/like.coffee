$(document).ready ->
  $('#like_up').click ->
    $.post '/like', {image_id}