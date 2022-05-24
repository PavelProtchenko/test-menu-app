module MenuBadgeHelper
  STATE_COLORS = ['btn-primary', 'btn-success', 'btn-danger']

  def change_badge_state(state)
    case state
    when 'new'
      STATE_COLORS.first
    when 'active'
      STATE_COLORS.second
    when 'blocked'
      STATE_COLORS.third
    end
  end
end
