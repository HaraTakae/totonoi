class Admin::AreasController < ApplicationController
  def index
    #投稿
    @area = Area.new
    #一覧
    @areas = Area.all
  end
  
  
  def edit
  end
end
