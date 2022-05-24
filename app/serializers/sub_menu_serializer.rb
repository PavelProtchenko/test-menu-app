class SubMenuSerializer < Blueprinter::Base
  identifier :id

  view :normal do
    fields :name,
           :aasm_state,
           :parent_id
  end      
end
