class ImagesController < ApplicationController

  def index
    @images = Image.page(params[:page]).per(5)
  end

  def show
    @image = Image.includes(:likes).find(params[:id])
    @comment = Comment.new(params[:comment])
    @comments = Comment.includes(:user).where('image_id = :id', id: params[:id]).page(params[:page]).per(3)
  end

  def more_comments
    comments = Comment.where('image_id = :id', id: params[:id]).order('created_at DESC')
                            .includes(:user).offset(3).page(params[:page]).per(3)
    render json: comments.to_json(include: {user: {only: :name}})
  end

end