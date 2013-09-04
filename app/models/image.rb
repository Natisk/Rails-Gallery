class Image < ActiveRecord::Base

  mount_uploader :img_name, ImageUploader

  # attr_accessible :title, :body

  belongs_to :category

end
