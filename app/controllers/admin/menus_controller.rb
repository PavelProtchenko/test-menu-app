class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.includes(:sub_menus)
                 .search(params[:search], params[:state], params[:parent_name])
    render :index
  end

  def search
    @search = SearchService.new(params[:search]).fetch
    render :index
  end
end
