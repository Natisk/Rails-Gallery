require 'spec_helper'

describe Image do

  context 'relations and validations' do
    it {should have_many(:likes).dependent(:destroy)}
    it {should have_many(:comments).dependent(:destroy)}
    it {should belong_to(:category)}
    it {should validate_presence_of(:title)}
    it {should ensure_length_of(:title).is_at_least(3).is_at_most(255)}
    it {should validate_presence_of(:img_name)}
    it {should allow_mass_assignment_of(:title)}
    it {should allow_mass_assignment_of(:img_name)}
    it {should allow_mass_assignment_of(:category_id)}
    it {should allow_mass_assignment_of(:remote_img_name_url)}

    it 'create an Image' do
      FactoryGirl.create(:image)
      Image.count.should eq(1)
    end
  end

end