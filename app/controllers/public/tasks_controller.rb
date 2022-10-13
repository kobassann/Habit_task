class Public::TasksController < ApplicationController
  def index
    # @task = Task.all
    # search_options = {
    #   created_at_lteq_end_of_day: params[:created_at_lteq_end_of_day]
      # created_at_gteq: params[:created_at_gteq]
    # }
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
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
    @task.member_id = current_member.id
    @task.save!
    redirect_to member_path(@member)
  end

  private
  def task_params
    params.require(:task).permit(:content, :memo, :start_time, tag_ids: [])
  end
end
