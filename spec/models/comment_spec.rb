require 'spec_helper'

describe Comment do

  context 'relations & validations' do
    it {should belong_to(:user)}
    it {should belong_to(:image)}
    it {should validate_presence_of(:body)}
    it {should ensure_length_of(:body).is_at_least(2).is_at_most(255)}
    it {should validate_presence_of(:user_id)}
    it {should validate_numericality_of(:user_id).only_integer}
    it {should allow_mass_assignment_of(:body)}
    it {should allow_mass_assignment_of(:image_id)}

    it 'must track the comment with creating an event' do
      fg_user = FactoryGirl.create(:user)
      fg_image = FactoryGirl.create(:image)
      fg_user.name.should eq('Test Usver')
      fg_comment = fg_image.comments.new(body: 'my first comment')
      fg_comment.user_id = fg_user.id
      fg_comment.save
      events = Event.all
      events.count.should eq(1)
    end
  end

end