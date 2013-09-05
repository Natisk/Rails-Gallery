class ImagesController < ApplicationController

  def index
    @images = Image.page(params[:page]).per(3)
  end

  def show
    @image = Image.includes(:comments).find(params[:id])
    @comments = Comment.where('image_id = :id', id: @image.id)
  end

end