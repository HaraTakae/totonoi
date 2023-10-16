class Admin::FacilityPostsController < ApplicationController
  def index
    @facility_posts = FacilityPost.all
  end

  def show
    @facility_post = FacilityPost.find(params[:id])
  end
  
  def destroy
    @facility_post = FacilityPost.find(params[:id])
    @facility_post.destroy
    flash[:notice] = "選択いただいた投稿を削除しました"
    redirect_to admin_facility_posts_path
  end
end
