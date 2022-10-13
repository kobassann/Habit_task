class Public::FavoritesController < ApplicationController
  def index
  end

  def create
    @favorite = current_member.favorites.create(task_id: params[:task_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @task = Task.find(params[:task_id])
    @favorite = current_member.favorites.find_by(task_id: @task.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
