# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  images_count :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

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
