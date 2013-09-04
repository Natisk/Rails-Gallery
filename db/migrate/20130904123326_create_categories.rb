class CreateCategories < ActiveRecord::Migration

  def change
    create_table :category do |t|
      t.string :title
      t.timestamps
    end
  end

end
