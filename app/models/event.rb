# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  user_action :string(255)
#  related_id  :integer
#  created_at  :datetime
#

class Event < ActiveRecord::Base

  attr_accessible :user_action, :user_id, :related_id

  belongs_to :user

end
