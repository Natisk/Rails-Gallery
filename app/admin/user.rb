ActiveAdmin.register User do

  filter :name, as: :string
  filter :email, as: :string

  index do
    selectable_column
    column :id
    column :name
    column :email
    default_actions
  end

  show do
    panel 'Image Details' do
      attributes_table_for user do
        row :id
        row :name
        row :email
      end
    end
  end

  form html: {enctype: 'multipart/form-data'} do |f|
    f.semantic_errors :base
    f.inputs 'Users', multipart: true do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end