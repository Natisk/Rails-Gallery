require 'pusher'

#Pusher.url = 'http://b15da0d38e1cf270a7b1:a8e7ec425dac974f5bb7@api.pusherapp.com/apps/55139'
Pusher.logger = Rails.logger

Pusher.app_id = '1'
Pusher.key = 'c46c644b78f84661ace01b35dffceabc'
Pusher.secret = '15c85d0ce00c492888423aca73f65d19'
Pusher.host = '127.0.0.1'
Pusher.port = '4567'

class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:create]

  def index
    @comments = Comment.order('created_at DESC').includes(:image, :user).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    if user_signed_in?
      @image = Image.find(params[:image_id])
      @comment = @image.comments.new(params[:comment])
      @comment.user = current_user
      if @comment.save
        Pusher['test_channel'].trigger('my_event', {message: 'hello world'})
        redirect_to image_path(@image)
      else
        redirect_to :back, notice: 'Body minimum 2 maximum 255 symbols'
      end
    end
  end

end