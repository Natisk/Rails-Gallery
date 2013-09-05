class Image < ActiveRecord::Base

  mount_uploader :img_name, ImageUploader

  attr_accessible :title, :img_name, :category_id

  has_many :likes
  has_many :comments
  belongs_to :category, counter_cache: true

  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :img_name, presence: true

end
