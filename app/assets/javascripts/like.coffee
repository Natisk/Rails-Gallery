$(document).ready ->

  $('#like_up').click ->
    $.post '/like-up', {image_id: $('.for_image img').attr 'id'}

  $('#like_down').click ->
    $.post '/like-down', {image_id: $('.for_image img').attr 'id'}