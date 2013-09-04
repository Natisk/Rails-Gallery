class Category < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  # attr_accessible :title, :body

  has_many :images, as: :fileable, dependent: :destroy

end
