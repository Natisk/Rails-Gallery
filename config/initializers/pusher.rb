require 'pusher'

Pusher.url = 'http://b15da0d38e1cf270a7b1:a8e7ec425dac974f5bb7@api.pusherapp.com/apps/55139'
Pusher.logger = Rails.logger

Pusher.app_id = Settings.pusher.ap_id
Pusher.key = Settings.pusher.key
Pusher.secret = Settings.pusher.secret

