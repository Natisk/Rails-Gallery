class ImagesController < ApplicationController

  def index
    @images = Image.page(params[:page]).per(5)
  end

  def show
    @image = Image.includes(:comments, :likes).find(params[:id])
    @comment = Comment.new(params[:comment])
  end

end