class SearchesController < ApplicationController
  def search
    @search = "True"
    @word = params[:word]
    search_facility_posts = FacilityPost.where("name LIKE?","%#{@word}%")
    
    @search_count = search_facility_posts.count
    
    if admin_signed_in?
      @facility_posts = search_facility_posts
      render 'admin/facility_posts/index'
    else
      if params[:area_id]
        area = Area.find(params[:area_id])
        @facility_posts = area.facility_posts
      else
        @facility_posts = search_facility_posts
        if @facility_posts.empty?
          flash.now[:notice] = "検索条件に一致する結果が見つかりませんでした。"
        end
      end

      @all_facility_posts = search_facility_posts
      @areas = Area.all
      render 'public/facility_posts/index'
    end
  end
end
