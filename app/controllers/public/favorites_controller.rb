class Public::FavoritesController < ApplicationController
  
  
  def create
    facility_post = FacilityPost.find(params[:facility_post_id])
    favorite = current_user.favorites.new(facility_post_id: facility_post.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    facility_post = FacilityPost.find(params[:facility_post_id])
    favorite = current_user.favorites.find_by(facility_post_id: facility_post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
