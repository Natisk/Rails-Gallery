class Comment < ActiveRecord::Base

  attr_accessible :body

  belongs_to :user, counter_cache: true
  belongs_to :image, counter_cache: true

end