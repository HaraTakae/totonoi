class Admin::HomesController < ApplicationController
    
  def top
    @facility_posts = FacilityPost.all
  end
end
