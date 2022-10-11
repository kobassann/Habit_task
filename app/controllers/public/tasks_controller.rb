class Public::TasksController < ApplicationController
  def index
    @task = Task.find(params[:id])
    @tasks = Task.all
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
     @task = Task.find(params[:id])
     @task.destroy
  end

  def create
    @member = current_member
    @task = Task.new(task_params)
    @task.save
    redirect_to member_path(@member)
  end

  private
  def task_params
    params.require(:task).permit(:content, :memo, :start_time)
  end
end
