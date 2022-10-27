class Public::MembersController < ApplicationController
   before_action :authenticate_member!
   before_action :ensure_guest_member, only: [:edit]

  def show
    @task = Task.new
    @tasks = current_member.tasks
    @member = current_member
    @favorites = Favorite.all
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @member = current_member
    if @member.email == 'guest@example.com'
      reset_session
      redirect_to :root
    else
    @member.destroy
    flash[:notice] = "退会しました"
    redirect_to root_path
    end
  end
  
  def favorites
    @member = Member.find(params[:id])
    @tasks = @member.favorite_tasks
  end

  private
  def member_params
    params.require(:member).permit(:nickname, :email)
  end

  def ensure_guest_member
    @member = Member.find(params[:id])
  end

end
