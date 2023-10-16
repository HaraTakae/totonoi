class Admin::FacilityPostsController < ApplicationController
  def index
    @facility_posts = FacilityPost.all
  end

  def show
    @facility_post = FacilityPost.find(params[:id])
  end
  
  def edit
    @facility_post = FacilityPost.find(params[:id])
  end
end
