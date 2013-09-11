class ImagesController < ApplicationController

  def index
    @images = Image.page(params[:page]).per(5)
  end

  def show
    @image = Image.includes(comments: :user, likes: :user).find(params[:id])
    @comment = Comment.new(params[:comment])
  end

  def create
    @recipients = Category.where('id = :id', id: params[:category_id]).first.users
    @image = Image.new
    if @image.save
      UserMailer.send_new_images
    end
  end

end