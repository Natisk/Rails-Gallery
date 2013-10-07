$(document).ready ->

  i = 2

  $(document).on 'click', '.more_comments', (event) ->
    page_num = parseInt($(event.target).attr('data-pages'))

    $.ajax
      type: 'post'
      url: '/more-comments'
      data: {id: ($('.for_image img').attr 'id'), page: i}
      success:(response) ->
        i++
        if i > page_num
          $(event.target).remove()

        $.each response, (key) ->

          comment = response[key]

          t = new Date(comment.created_at)
          t_year = t.getFullYear()
          t_day = t.getDate()
          t_min = t.getMinutes()
          t_hour = t.getUTCHours()
          t_month = (t.getMonth()+1)

          comment_date = t_year + '-' + twoDigits(t_month) + '-'\
          + twoDigits(t_day) + ' ' + twoDigits(t_hour) + ':' + twoDigits(t_min)

          $('.image_comments').append('<div class="img_comment"><div class="comment_user_name"><strong>'\
          + comment.user.name + '</strong><span>'\
          + comment_date + '</span></div><div class="comment_body">'\
          + comment.body + '</div></div>')
