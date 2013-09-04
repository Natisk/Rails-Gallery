class AddImageNameToImage < ActiveRecord::Migration

  def change
    add_column :images, :img_name, :string
  end

end
