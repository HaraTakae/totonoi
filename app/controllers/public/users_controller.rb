class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  # いいね一覧
  def index
    @favorites = Favorite.all
  end
  
  def show
    @user = current_user
    # ユーザーが投稿した施設情報を読み込む
    @facility_posts = @user.facility_posts
    # 関連するコメントも読み込む
    @comments = Comment.where(facility_post: @facility_posts)
  end

  def edit
    @user = User.find(params[:id])
  end

  def confirm_withdrawal
  end

  def new
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "名前を変更しました。"
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
end
