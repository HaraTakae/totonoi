class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  def show
    @user = current_user
  end

  def edit
  end

  def confirm_withdrawal
  end

  def new
  end
  
  private
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to root_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
end