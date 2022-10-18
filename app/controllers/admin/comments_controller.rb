class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
  end

end
