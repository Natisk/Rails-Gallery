class CreateImages < ActiveRecord::Migration

  def change
    create_table :images do |t|
      t.string :title
      t.string :img_name
      t.integer :category_id
      t.timestamps
    end
  end

end
