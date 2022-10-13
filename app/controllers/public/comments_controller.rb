class Public::CommentsController < ApplicationController
  def create
    @comment = current_member.comments.new(comment_params.merge(task_id: params[:task_id]))
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = Comment.find_by(id: params[:id], task_id: params[:task_id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text)
  end
end
