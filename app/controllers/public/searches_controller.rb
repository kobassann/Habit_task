class Public::SearchesController < ApplicationController

  def search
    @tasks = Task.search(params[:search]).page(params[:id]).per(5)
    @search_word = params[:search]
  end

end