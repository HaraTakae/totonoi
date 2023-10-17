class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @facility_posts = @user.facility_posts
  end

  def edit
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "選択いただいたユーザーを退会させました。"
    redirect_to admin_users_path
  end
end
