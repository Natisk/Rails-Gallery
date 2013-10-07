$(document).ready ->

  i = 2

  $(document).on 'click', '.more_comments', (event) ->
    page_num = parseInt($(event.target).attr('data-pages'))
    if page_num == i
      $(event.target).hide()
    else
      $.ajax
        type: 'post'
        url: '/more-comments'
        data: {id: ($('.for_image img').attr 'id'), page: i}
        success:(response) ->
          i++
          $.each response, (key, value) ->

            comment = response[key]

            t = new Date(comment.created_at)
            t_year = t.getFullYear()
            t_day = t.getDate()
            t_min = t.getMinutes()
            t_hour = t.getUTCHours()
            t_month = (t.getMonth()+1)

            if t_month < 10
              t_month = '0' + t_month
            else
              t_month

            comment_date = t_year + '-' + t_month + '-' + t_day + ' ' + t_hour + ':' + t_min

            $('.image_comments').append('<div class="img_comment"><div class="comment_user_name"><strong>'\
            + comment.user.name + '</strong><span>'\
            + comment_date + '</span></div><div class="comment_body">'\
            + comment.body + '</div></div>')
