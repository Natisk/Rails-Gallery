class VisitedLink < ActiveRecord::Base

  attr_accessible :link, :user_id

  belongs_to :user

end
