class Public::FavoritesController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @favorite = current_member.favorites.create(task_id: params[:task_id])
  end

  def destroy
    @task = Task.find(params[:task_id])
    @favorite = current_member.favorites.find_by(task_id: @task.id)
    @favorite.destroy
  end
end
