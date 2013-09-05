class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.create
  end

end