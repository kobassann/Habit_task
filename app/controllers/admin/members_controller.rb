class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  # def edit
  #   @member = Member.find(params[:id])
  # end

  # def update
  #   @member = Member.find(params[:id])
  # end

  def destroy
    @member = Member.find(params[:id])
  end
end
