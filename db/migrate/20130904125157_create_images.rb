class CreateImages < ActiveRecord::Migration

  def change
    create_table :images do |t|
      t.string :title
      t.string :img_name
      t.integer :category_id
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      t.timestamps
    end
  end

end
