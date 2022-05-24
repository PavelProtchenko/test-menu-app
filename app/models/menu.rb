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

  def self.search(search = '', state = '')
    @scope = Menu.all
  
    result = @scope
    result = result.where("name iLIKE ?", "%#{search}%") if search.present?
    result = result.where("aasm_state iLIKE ?", "%#{state}%") if state.present?
  
    result
  end
end
