class Public::SearchesController < ApplicationController

  def search
    @tasks = Task.search(params[:search])
    @search_word = params[:search]
  end

end