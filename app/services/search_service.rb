class SearchService
  def initialize(scope)
    @scope = Menu.all
  end

  def fetch(params = {})
    result = @scope
    result = result.where("name iLIKE ?", "%#{params[:search]}%") if params[:search].present?
    result = result.joins(:sub_menus).where("name iLIKE ?", "%#{params[:parent_name]}%") if params[:parent_name].present?
    result = result.joins(:sub_menus).where("aasm_state iLIKE ?", "%#{params[:state]}%") if params[:state].present?

    result
  end
end