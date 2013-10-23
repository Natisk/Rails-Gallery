require 'spec_helper'

describe Like do

  context 'relations and validations' do
    it {should belong_to(:user)}
    it {should belong_to(:image)}
    it {should allow_mass_assignment_of(:user_id)}
    it {should allow_mass_assignment_of(:image_id)}
  end

  context 'hooks for likes' do

  end

end