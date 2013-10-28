require 'spec_helper'

describe LikesController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image)
  end

  context 'create like' do
    it 'should create a like' do
      sign_in @user
      like_img = @user.likes.create(image_id: @image.id)
      like_img.count.should eq(1)
    end
  end

end