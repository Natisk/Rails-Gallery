class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:create]

  def index
    @comments = Comment.order('created_at DESC').includes(:image, :user).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    pusher = Pusher.new('c46c644b78f84661ace01b35dffceabc')
    pusher['test_channel'].trigger('my_event', {message: 'hello world'})
    if user_signed_in?
      @image = Image.find(params[:image_id])
      @comment = @image.comments.new(params[:comment])
      @comment.user = current_user
      if @comment.save
        #Pusher['test_channel'].trigger('my_event', {message: 'hello world'})
        redirect_to image_path(@image)
      else
        redirect_to :back, notice: 'Body minimum 2 maximum 255 symbols'
      end
    end
  end

end