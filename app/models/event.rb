class Event < ActiveRecord::Base

  attr_accessible :user_action, :user_id, :related_id

  belongs_to :user

end
