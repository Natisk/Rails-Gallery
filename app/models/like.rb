# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  image_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ActiveRecord::Base

  after_create :track_added_like
  before_destroy :track_deleted_like

  attr_accessible :user_id, :image_id

  belongs_to :user, counter_cache: true
  belongs_to :image, counter_cache: true

  def track_added_like
    Event.create(user_id: self.user.id , related_id: self.image.id, user_action: 'like add')
  end

  def track_deleted_like
    Event.create(user_id: self.user.id , related_id: self.image.id, user_action: 'like del')
  end

end
