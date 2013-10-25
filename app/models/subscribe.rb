# == Schema Information
#
# Table name: subscribes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subscribe < ActiveRecord::Base

  attr_accessible :user_id, :category_id

  belongs_to :user
  belongs_to :category

  validates :user_id, uniqueness: {scope: :category_id}

end
