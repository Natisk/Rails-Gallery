class Image < ActiveRecord::Base

  mount_uploader :img_name, ImageUploader

  after_create  :user_sender

  attr_accessible :title, :img_name, :category_id

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :category, counter_cache: true

  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :img_name, presence: true

  def user_sender
    Resque.enqueue(SubscriptionMailer, self.id)
  end

end
