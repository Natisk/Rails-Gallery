require 'spec_helper'

describe LikesController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image)
  end

  context 'create like' do
    it 'should create a like' do
      sign_in @user
      post :create, image_id: @image.id
      Like.count.should be 1
    end
  end

end