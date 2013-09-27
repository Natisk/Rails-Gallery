class PusherController < ApplicationController

  protect_from_forgery except: :auth # prevents CSRF check on auth

  def auth
    if current_user
      # Refer to http://pusher.com/docs/authenticating_users for SSD
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id])
      render json: response
    else
      render text: 'Not authorized', status: '403'
    end
  end

end