class Category < ActiveRecord::Base

  attr_accessible :title

  has_many :images, dependent: :destroy
  has_many :subscribes

  validates :title, presence: true, length: {minimum: 2, maximum: 255}

end
