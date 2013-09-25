#= require active_admin/base

$(document).ready ->

  $(document).on "click", "button.delete_img", ->
    $(this).closest('.image_sepr').remove()
    false

  $(document).on "click", ".image_sepr img", (event) ->
    if $('#lightbox .original_img img')
      $('#lightbox .original_img img').remove()

    img = new Image();
    img.src = event.target.src
    $('#lightbox .original_img').append(img)

    img.onload = ->
      div_height = @height
      div_width = @width
      $('#lightbox .original_img').attr 'style', ('margin-top: -' + div_height/2 + 'px; margin-left: -' + div_width/2 + 'px;')
      $('#lightbox').show()

  $(document).on "click", ".close_box", ->
    $('#lightbox').hide()

  $(document).on "click", ".overlay", ->
    $('#lightbox').hide()

  $('form').bind 'ajax:success', ->
    $(this).closest('.image_sepr').addClass('green')
    $(this).find('select').remove()
    $(this).find('input').remove()
    $(this).append('<p>Image was successfully added</p>')



