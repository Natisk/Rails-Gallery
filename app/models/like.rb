class Like < ActiveRecord::Base

  attr_accessible :user_id, :image_id

  belongs_to :user, counter_cache: true
  belongs_to :image, counter_cache: true

  has_one :event

end