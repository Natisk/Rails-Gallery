require 'spec_helper'

describe Comment do

  context 'relations & validations' do
    it {should belong_to(:user)}
    it {should belong_to(:image)}
    it {should validate_presence_of(:body)}
    it {should ensure_length_of(:body).is_at_least(2).is_at_most(255)}
    it {should validate_presence_of(:user_id)}
    it {should validate_numericality_of(:user_id).only_integer}
    it {should allow_mass_assignment_of(:body) }

    it 'must track the comment with creating an event' do
      fu = FactoryGirl.create(:user)
      fu.name.should eq('Test Usver')
      #fu.comments.create(body: 'my first comment', image_id: 1)
      #ev = Event.all
      #ev.count.should eq(1)
    end
  end

end