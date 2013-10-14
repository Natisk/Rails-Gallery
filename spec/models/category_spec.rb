require 'spec_helper'

describe Category do

  context 'relations and validations' do
    it {should validate_presence_of(:title)}
    it {should ensure_length_of(:title).is_at_least(2).is_at_most(255)}
    it {should have_many(:images).dependent(:destroy)}
    it {should have_many(:subscribes)}
    it {should have_many(:users).through(:subscribes)}
    it {should allow_mass_assignment_of(:title) }
  end

end