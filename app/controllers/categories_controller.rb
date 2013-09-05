class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:images).order('created_at DESC')
  end

  def show
    @category = Category.where('title = :title', title: params[:title]).first
    @images = Image.where('category_id = :id', id: @category.id).page(params[:page]).per(1)
  end

end