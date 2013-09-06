class Category < ActiveRecord::Base

  attr_accessible :title

  has_many :images, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2, maximum: 255}

end
