#= require active_admin/base

$(document).ready ->

  $(document).on "click", "button.delete_img", ->
    $(this).closest('.image_sepr').remove();

  $(document).on "click", ".image_sepr img", (event) ->
    $('#lightbox .original_img').append('<img src="' + event.target.src + '" />')
    div_height = $('#lightbox .original_img img').height()
    alert div_height
    div_width = $('#lightbox .original_img img').width()
    $('#lightbox .original_img').attr 'style', ('margin-top: -' + div_height/2 + 'px'; 'margin-left: -' + div_width/2 + 'px')
    $('#lightbox').show()

  $(document).on "click", ".overlay", ->
    $('#lightbox').hide()
