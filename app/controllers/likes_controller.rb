class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(image_id: params[:image_id])
    @like.save
  end

  def remove_like
    @like = current_user.likes
  end

end