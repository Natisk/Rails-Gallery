class CreateVisitedLinks < ActiveRecord::Migration

  def change
    create_table :visited_links do |t|
      t.integer :user_id
      t.string :link
      t.datetime :created_at
    end
  end

end
