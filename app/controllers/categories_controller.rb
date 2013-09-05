class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:images).order('created_at DESC')
  end

  def show
    @category = Category.includes(:images).where('title = :title', title: params[:title]).first
  end

end