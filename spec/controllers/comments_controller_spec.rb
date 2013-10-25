require 'spec_helper'

describe CommentsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image)
    5.times {@image.comments.create(body: 'nice comment')}
    request.env['HTTP_REFERER'] = '/my_way'
  end

  context 'index test' do
    it 'assigns @comments' do
      get :index
      assert_template :index
      assert_template layout: 'layouts/application'
      assert_response :success
    end
  end

  context 'create test' do
    it 'assigns @comment' do
      sign_in @user
      post :create, comment: {body: 'sgdgrgergeg'}, image_id: @image
      comment = Comment.last
      assigns[:comment].should eq(comment)
      flash[:notice].should be_nil
      response.should redirect_to(image_path(@image))
    end
    it 'comment not valid' do
      sign_in @user
      post :create, comment: {body: 's'}, image_id: @image
      flash[:notice].should eq('Body minimum 2 maximum 255 symbols')
      assert_redirected_to('/my_way')
    end
  end

end