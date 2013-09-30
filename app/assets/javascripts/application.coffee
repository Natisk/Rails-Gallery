#= require jquery
#= require jquery_ujs
#= require like
#= require subscribe
#= require comments
#= require pusher
#= require_tree.

$(document).ready ->

  Pusher.host = '127.0.0.1'
  Pusher.ws_port = '3004'
  Pusher.wss_port = '3004'
  Pusher.sockjs_host = undefined
  Pusher.sockjs_http_port = undefined
  Pusher.sockjs_https_port = undefined
  Pusher.sockjs_path = undefined

#  Pusher.stats_host = undefined
#  Pusher.cdn_http = undefined
#  Pusher.cdn_https = undefined

  pusher = new Pusher('c46c644b78f84661ace01b35dffceabc')
  channel = pusher.subscribe('test_channel')
  channel.bind 'my_event', (data) ->
    alert data.message
