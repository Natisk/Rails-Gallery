#= require jquery
#= require jquery_ujs
#= require like
#= require subscribe
#= require comments
#= require image
#= require pusher
#= require slider/my_slider_script

twoDigits = (text) ->
  if parseInt(text) < 10
    text = '0' + text
  else
    text

$(document).ready ->

  window.twoDigits = twoDigits

#  ----if using slanger------
#  Pusher.host = 'localhost'
#  Pusher.ws_port = '3004'
#  Pusher.wss_port = '3004'
#  Pusher.sockjs_host = undefined
#  Pusher.sockjs_http_port = undefined
#  Pusher.sockjs_https_port = undefined
#  Pusher.sockjs_path = undefined

#  ----Pusher info----------
#  Pusher.log = (message) ->
#    window.console.log message  if window.console and window.console.log

  pusher = new Pusher('b15da0d38e1cf270a7b1')
  channel = pusher.subscribe('test_channel')
  channel.bind 'my_event', (data) ->

    t = new Date(data.message.created_at)
    t_year = t.getFullYear()
    t_day = t.getDate()
    t_min = t.getMinutes()
    t_hour = t.getUTCHours()
    t_month = (t.getMonth()+1)

    comment_date = t_year + '-' + twoDigits(t_month) + '-' + twoDigits(t_day) + ' '\
                  + twoDigits(t_hour) + ':' + twoDigits(t_min)

    $('.comments_all').prepend('<div class="comment"><div class="comment_top"><div class="comment_name">'\
                                + data.user.name + '</div><div class="comment_date">'\
                                + comment_date + '</div><div class="comment_image"><a href="'\
                                + data.url + '">' + data.img_title + '</a></div></div><div class="comment_body">'\
                                + data.message.body + '</div></div>')