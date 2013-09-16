#$("#like_up").on "click", ->
#  $.ajax(
#    url: '/like-up'
#    context: document.body
#  ).done ->
#  $(this).removeClass 'btn-primary'
#  $(this).addClass 'btn-danger'
#
#$("#like_down").on "click", ->
#  $.ajax(
#    url: '/like-down'
#    context: document.body
#  ).done ->
#  $(this).removeClass 'btn-danger'
#  $(this).addClass 'btn-primary'

$(document).ready ->

  $('#like_up').click ->
    $.post '/like-up', {image_id: $('.for_image img').attr 'id'}

  $('#like_down').click ->
    $.post '/like-down', {image_id: $('.for_image img').attr 'id'}

