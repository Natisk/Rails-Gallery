class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:images)
  end

  def show
    @category = Category.find(params[:id])
  end

end