class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:create]
  caches_action :index

  def index
    @comments = Comment.order('created_at DESC').includes(:image, :user).page(params[:page]).per(10)
  end

  def create
    if user_signed_in?
      @image = Image.find(params[:image_id])
      @comment = @image.comments.new(params[:comment])
      @comment.user = current_user
      if @comment.save
        Pusher['test_channel'].trigger('my_event', {message: @comment, user: current_user,
                                                    url: image_path(@image).to_s,
                                                    img_title: @comment.image.title})
        redirect_to image_path(@image)
      else
        redirect_to :back, notice: 'Body minimum 2 maximum 255 symbols'
      end
    end
  end

end