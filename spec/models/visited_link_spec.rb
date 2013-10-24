require 'spec_helper'

describe VisitedLink do

  context 'relations and validations' do
    it {should belong_to(:user)}
    it {should allow_mass_assignment_of(:link)}
    it {should allow_mass_assignment_of(:user_id)}
  end

end