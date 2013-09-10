class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:images).order('created_at DESC')
  end

  def show
    @category = Category.where('title = :title', title: params[:title]).first
    @images = Image.where('category_id = :id', id: @category.id).page(params[:page]).per(5)
  end

  def subscribe
    user_subscribe = current_user.subscribes.new(category_id: params[:category_id])
    user_subscribe.save
    render nothing: true
  end

  def unsubscribe
    user_unsubscribe = Subscribe.where('user_id = :user_id AND category_id = :category_id', user_id: current_user.id, category_id: params[:category_id]).first
    user_unsubscribe.destroy
    render nothing: true
  end

end