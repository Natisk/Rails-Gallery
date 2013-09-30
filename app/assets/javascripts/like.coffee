$(document).ready ->

  $(document).on "click", "#like_up", (event) ->
    $.ajax
      type: 'post'
      url: '/like-up'
      data: {image_id: $('.for_image img').attr 'id'}
      success: ->
        $(event.target).removeClass 'btn-primary'
        $(event.target).addClass 'btn-danger'
        $(event.target).text('DisLike')

        changeButton = $("#like_up")[0]
        changeButton.id = 'like_down'

        $("#like_up").replaceWith changeButton

        count = $(".image_likes span").text()
        count = parseInt(count) + 1

        $(".image_likes span").text count

  $(document).on "click", "#like_down", (event) ->
    $.ajax
      type: 'post'
      url: '/like-down'
      data: {image_id: $('.for_image img').attr 'id'}
      success: ->
        $(event.target).removeClass 'btn-danger'
        $(event.target).addClass 'btn-primary'
        $(event.target).text('Like')

        changeButton = $("#like_down")[0]
        changeButton.id = 'like_up'

        $("#like_down").replaceWith changeButton
        discount = $(".image_likes span").text()
        discount = parseInt(discount) - 1

        $(".image_likes span").text discount




