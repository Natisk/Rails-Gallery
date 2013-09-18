class AddRelatedIdToEvent < ActiveRecord::Migration

  def change
    add_column :events, :related_id, :integer
  end

end
