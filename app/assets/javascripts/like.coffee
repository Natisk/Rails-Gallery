$(document).ready ->
  $('#like_up').click ->
    $.post '/like-up', {image_id: $('.for_image img').attr 'id'}