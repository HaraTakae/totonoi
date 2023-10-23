class Public::FacilityPostsController < ApplicationController
  def index
    @facility_posts = FacilityPost.all
    @areas = Area.all
  end

  def new
    @facility_post = FacilityPost.new
  end
  
  def create
    @facility_post = FacilityPost.new(facility_post_params)
    
    if @facility_post.save
      #binding.pry
      flash[:notice] = "新規投稿しました。"
      redirect_to facility_post_path(@facility_post.id)
    else
      flash[:notice] = "新規投稿内容に不備があります。"
      render :new
    end
  end

  def show
    @facility_post = FacilityPost.find(params[:id])
    @comment = Comment.new  # 空のコメントオブジェクトを作成
  end

  def edit
    @facility_post = FacilityPost.find(params[:id])
  end
  
  def update
    @facility_post = FacilityPost.find(params[:id])
    if @facility_post.update(facility_post_params)
      flash[:notice] = "投稿の変更が完了しました。"
      redirect_to facility_post_path(@facility_post.id)
    else
      flash[:notice] = "投稿の変更内容に不備があります。"
      render :edit
    end
  end
  
  def destroy
    @facility_post = FacilityPost.find(params[:id])
    @facility_post.destroy
    flash[:notice] = "選択いただいた投稿を削除しました"
    redirect_to user_path(current_user)
  end
  
  private
  def facility_post_params
    params.require(:facility_post).permit(:images, :name, :introduction, :area_id, :star, :address).merge(user_id:current_user.id)
  end
end
