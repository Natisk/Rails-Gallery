class ImagesController < ApplicationController

  def index
    @images = Image.order('likes_count DESC').page(params[:page]).per(3)
  end

  def show
    @image = Image.includes(:comments, :likes).find(params[:id])
    @comment = Comment.new(params[:comment])
  end

end