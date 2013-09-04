class AddImageToCategories < ActiveRecord::Migration

  def change
    add_column :category, :image, :string
  end

end
