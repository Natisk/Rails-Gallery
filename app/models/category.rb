class Category < ActiveRecord::Base

    # attr_accessible :title, :body

  has_many :images, as: :fileable, dependent: :destroy

end
