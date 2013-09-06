class Comment < ActiveRecord::Base

  attr_accessible :body

  belongs_to :user, counter_cache: true
  belongs_to :image, counter_cache: true

  validates :body, presence: true, length: {minimum: 2, maximum: 255}
  validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0}

end