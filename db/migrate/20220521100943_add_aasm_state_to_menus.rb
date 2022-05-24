class AddAasmStateToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :aasm_state, :string
  end
end
