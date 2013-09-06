class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    if user_signed_in?
      @image = Image.find(params[:image_id])
      @comment = @image.comments.new(params[:comment])
      @comment.user = current_user
      if @comment.save
        redirect_to image_path(@image)
      else
        redirect_to :back, notice: 'Body minimum 2 maximum 255 symbols'
      end
    end
  end

end