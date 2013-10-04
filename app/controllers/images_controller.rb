class ImagesController < ApplicationController

  def index
    @images = Image.page(params[:page]).per(5)
  end

  def show
    @image = Image.includes(:likes).find(params[:id])
    @comment = Comment.new(params[:comment])
    @comments = Comment.includes(:user).where('image_id = :id', id: params[:id]).limit(9)
  end

end