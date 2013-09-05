class Image < ActiveRecord::Base

  mount_uploader :img_name, ImageUploader

  attr_accessible :title, :img_name

  belongs_to :category

end
