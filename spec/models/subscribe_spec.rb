require 'spec_helper'

describe Subscribe do

  context 'relations and validations' do
    it {should belong_to(:user)}
    it {should belong_to(:category)}
    it {should allow_mass_assignment_of(:user_id)}
    it {should allow_mass_assignment_of(:category_id)}
    it {should validate_uniqueness_of(:user_id).scoped_to(:category_id)}
  end

end