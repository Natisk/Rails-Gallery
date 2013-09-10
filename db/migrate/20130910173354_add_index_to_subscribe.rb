class AddIndexToSubscribe < ActiveRecord::Migration

  def change
    add_index :subscribes, [:category_id, :user_id], :unique => true
  end

end
