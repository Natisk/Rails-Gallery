class LikesController < ApplicationController

  before_filter :authenticate_user!, only: [:create, :destroy]

  def create
    @like = current_user.likes.new(image_id: params[:image_id])
    if @like.save
      render nothing: true
      Event.create(user_id: current_user.id, related_id: @like.id, user_action: 'like add')
    else
      render nothing: true
    end

  end

  def destroy
    @like = Like.where('user_id = :user_id AND image_id = :image_id', user_id: current_user.id,
                       image_id: params[:image_id]).first
    if @like.destroy
      render nothing: true
      Event.create(user_id: current_user.id, related_id: @like.id, user_action: 'like del')
    else
      render nothing: true
    end
  end

end