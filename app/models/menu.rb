class Menu < ApplicationRecord
  include AASM

  has_many :sub_menus, class_name: 'Menu', foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent_category, class_name: 'Menu', foreign_key: :parent_id, optional: true

  validates :name, presence: true

  aasm do
    state :new, initial: true
    state :active, :blocked

    event :activating do
      transitions from: :new, to: :active
    end

    event :newing do
      transitions from: :blocked, to: :new
    end

    event :blocking do
      transitions from: [:new, :active], to: :blocked
    end
  end

  def self.search(search = '', state = '', parent_name = '')
    @scope = Menu.all
  
    result = @scope
    # binding.pry
    result = result.where("name iLIKE ?", "%#{search}%") if search.present?
    result = result.where("aasm_state iLIKE ?", "%#{state}%") if state.present?
  
    result
    # @scope = order(created_at: :asc)
    # if search
    #   @scope.where("name iLIKE ?", "%#{search}%")
    # elsif state
    #   @scope.where("aasm_state iLIKE ?", "%#{state}%")
    # else
    #   order(created_at: :asc)
    # end
    # @scope
  end
end
