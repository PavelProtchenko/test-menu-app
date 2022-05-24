class MenuSerializer < Blueprinter::Base
  identifier :id

  view :normal do
    fields :name,
           :aasm_state   
    association :sub_menus, blueprint: SubMenuSerializer, view: :normal
  end
end
