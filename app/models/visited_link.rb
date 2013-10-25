# == Schema Information
#
# Table name: visited_links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  link       :string(255)
#  created_at :datetime
#

class VisitedLink < ActiveRecord::Base

  attr_accessible :link, :user_id

  belongs_to :user

end
