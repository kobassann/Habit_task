class Public::CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = current_member.comments.new(comment_params)
    @comment.save
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text, :task_id)
  end
end
