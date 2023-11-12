class Public::HomesController < ApplicationController
  def top
    @facility_posts = FacilityPost.all.order(created_at: :desc)
    @areas = Area.all
    @area_id = params[:area_id]
  end
end