class Public::AreasController < ApplicationController
  def show
    @area = Area.find(params[:id])
    @areas = Area.all
  end
end
