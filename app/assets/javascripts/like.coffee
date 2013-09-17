$(document).ready ->

  $(document).on "click", "#like_up", ->
    $.ajax(
      type: 'post'
      url: '/like-up'
      data: {image_id: $('.for_image img').attr 'id'}
    ).done ->
      changeButton = $("#like_up")[0]
      changeButton.id = 'like_down'
      $("#like_up").replaceWith changeButton
      count = $(".image_likes span").text()
      count = parseInt(count) + 1
      $(".image_likes span").text count
    $(this).removeClass 'btn-primary'
    $(this).addClass 'btn-danger'
    $(this).text('DisLike')

  $(document).on "click", "#like_down", ->
    $.ajax(
      type: 'post'
      url: '/like-down'
      data: {image_id: $('.for_image img').attr 'id'}
    ).done ->
      changeButton = $("#like_down")[0]
      changeButton.id = 'like_up'
      $("#like_down").replaceWith changeButton
      discount = $(".image_likes span").text()
      discount = parseInt(discount) - 1
      $(".image_likes span").text discount
    $(this).removeClass 'btn-danger'
    $(this).addClass 'btn-primary'
    $(this).text('Like')

