class CreateEvents < ActiveRecord::Migration

  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :user_action
      t.date :created_at
    end
  end

end
