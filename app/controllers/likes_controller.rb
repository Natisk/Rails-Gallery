class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(image_id: params[:image_id])
    if @like.save
      render nothing: true
    else
      render nothing: true
    end

  end

  def destroy
    @like = Like.where('user_id = :user_id AND image_id = :image_id', user_id: current_user.id, image_id: params[:image_id]).first
    @like.destroy
  end

end