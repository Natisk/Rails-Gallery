#= require active_admin/base

$(document).ready ->

  $(document).on "click", "button.delete_img", ->
    $(this).closest('.image_sepr').remove();
