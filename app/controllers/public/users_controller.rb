class Public::UsersController < ApplicationController
  def show
    @user = current_end_user
  end

  def edit
  end

  def confirm_withdrawal
  end

  def new
  end
end
