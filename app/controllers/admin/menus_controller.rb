class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.includes(:sub_menus)
                 .search(params[:search], params[:state], params[:parent_name])
    render :index
  end
end
