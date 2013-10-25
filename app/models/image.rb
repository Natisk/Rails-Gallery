# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  img_name       :string(255)
#  category_id    :integer
#  comments_count :integer          default(0)
#  likes_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Image < ActiveRecord::Base

  mount_uploader :img_name, ImageUploader

  after_create  :user_sender

  attr_accessible :title, :img_name, :category_id, :remote_img_name_url

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :category, counter_cache: true

  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :img_name, presence: true

  def user_sender
    Resque.enqueue(SubscriptionMailer, self.id)
  end

end
