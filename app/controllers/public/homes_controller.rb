class Public::HomesController < ApplicationController
  def top
    @facility_posts = FacilityPost.all
    @areas = Area.all
    @area_id = params[:area_id]
  end
end
