class Image < ActiveRecord::Base

  mount_uploader :img_name, ImageUploader

  after_create  :user_sender

  attr_accessible :title, :img_name, :category_id

  has_many :likes
  has_many :comments
  belongs_to :category, counter_cache: true

  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :img_name, presence: true

  def user_sender
    category = Category.includes(:users).find(self.category_id)
    category.users.each do |recipient|
      UserMailer.new_images(recipient).deliver
    end
  end

end
