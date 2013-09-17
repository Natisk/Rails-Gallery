class Event < ActiveRecord::Base

  attr_accessible :date_of_action, :user_action, :user_id

  belongs_to :user
  has_one :comment, through: :user


end
