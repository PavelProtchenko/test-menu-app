class SearchMenuService
  def initialize(params = {})
    @params = params
  end

  def call
    find_menu
  end

  private

  def find_menu
    if @params.present? && @params[:state] == 'active'
      Menu.includes(:sub_menus).where(aasm_state: @params[:state])
    else
      Menu.includes(:sub_menus).order(created_at: :asc)
    end
  end
end
