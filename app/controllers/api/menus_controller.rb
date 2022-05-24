class Api::MenusController < ApplicationController
  def index
    @menus = SearchMenuService.new(params).call

    render json: MenuSerializer.render(@menus, view: :normal), status: :ok
  end
end
