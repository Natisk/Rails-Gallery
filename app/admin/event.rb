ActiveAdmin.register User do

  menu label: 'Events'

  index do
    selectable_column
    column :email
    column :name
    default_actions
  end

end