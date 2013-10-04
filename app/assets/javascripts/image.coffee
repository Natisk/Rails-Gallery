$(document).ready ->

  $(document).on 'click', '.more_comments', (event) ->
    $.ajax
      type: 'post'
      url: '/more-comments'
      data: {id: $('.for_image img').attr 'id', page}
      success:(response) ->
        $.each response, (key, value) ->

          comment = response[key]

          $('.image_comments').append('<div class="img_comment"><div class="comment_user_name"><strong>'\
          + comment.user.name + '</strong><span>'\
          + comment.created_at + '</span></div><div class="comment_body">'\
          + comment.body + '</div></div>')
