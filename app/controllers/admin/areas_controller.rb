class Admin::AreasController < ApplicationController
  def index
    #投稿
    @area = Area.new
    #一覧
    @areas = Area.all
  end
  
  def create
    @area = Area.new(area_params)
    if @area.save
      flash[:notice] = "エリアを追加しました。"
      redirect_to '/admin/areas'
    else
      flash[:notice] = "入力が必要です。"
      @areas = Area.all
      render :index
    end
  end
  
  def edit
    @area = Area.find(params[:id])
  end
  
  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      flash[:notice] = "変更しました。"
      redirect_to '/admin/areas'
    else
      flash[:notice] = "変更に失敗しました。"
      render :edit
    end
  end
  
  
  private
  
  def area_params
    params.require(:area).permit(:name)
  end
end
