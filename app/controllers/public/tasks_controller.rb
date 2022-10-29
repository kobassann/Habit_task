class Public::TasksController < ApplicationController

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)

    if params[:q].present? && params[:q][:tags_id_eq]
      @select_index = params[:q][:tags_id_eq]
    else
      @select_index = 0
    end

    @task = Task.all
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
    if params[:task][:tag_ids] == [""]
      redirect_to member_path(current_member)
    else
      @member = current_member
      @task = Task.new(task_params)
      @task.member_id = current_member.id
      @task.save
      redirect_to member_path(@member)
    end
  end

  def search
    @tasks = Task.search(params[:search])
  end

  private
  def task_params
    params.require(:task).permit(:content, :memo, :start_time, tag_ids: [])
  end
end
