require 'spec_helper'

describe CommentsController do

  before(:each) do
    user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image)
    5.times {user.comments.create(image_id: @image, body: 'nice comment')}
  end

  context 'index test' do
    it 'assigns @comments' do
      get :index
      assigns(:comments).include?(Comment.last).should be true
      assert_template :index
      assert_template layout: 'layouts/application'
      assert_response :success
    end
  end

end