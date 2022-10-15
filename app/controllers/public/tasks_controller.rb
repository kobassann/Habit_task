class Public::TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).order(created_at: :desc)
    
    @task = Task.all
    if params[:tag_ids]
      @task = []
      params[:tag_ids].each do |key, value|
        @task += Tag.find_by(name: key).tasks if value == "1"
      end
      @task.uniq!
    end
    @task = params[:tag_id].present? ? Tag.find(params[:tag_id]).tasks : Task.all
  end

  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
  end

  def update
    @task = Task.find(params[:id])
    if@task.update(task_params)
      redirect_to member_path
    else
      render :edit
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
     @task = Task.find(params[:id])
     @task.destroy
     redirect_to member_path
  end

  def create
    @member = current_member
    @task = Task.new(task_params)
    @task.member_id = current_member.id
    @task.save!
    redirect_to member_path(@member)
  end

  private
  def task_params
    params.require(:task).permit(:content, :memo, :start_time, tag_ids: [])
  end
end
