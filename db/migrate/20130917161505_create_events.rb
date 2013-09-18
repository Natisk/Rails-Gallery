class CreateEvents < ActiveRecord::Migration

  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :user_action
      t.integer :related_id
      t.datetime :created_at
    end
  end

end
