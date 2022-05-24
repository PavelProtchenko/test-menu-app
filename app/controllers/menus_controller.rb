class MenusController < ApplicationController
  def index
    @menus = Menu.includes(:sub_menus).order(created_at: :asc)
    render :index
  end
end
