class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:image)
  end

  def show
    @category = Category.find(params[:id])
  end

end