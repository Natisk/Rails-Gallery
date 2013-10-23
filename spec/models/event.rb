require 'spec_helper'

describe Comment do

  context 'event test' do
    it {should belong_to(:user)}
    it {should allow_mass_assignment_of(:user_action)}
    it {should allow_mass_assignment_of(:user_id)}
    it {should allow_mass_assignment_of(:related_id)}
  end

end