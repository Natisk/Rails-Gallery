require 'spec_helper'

describe ImagesController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @category = FactoryGirl.create(:category)
    @image = @category.images.create(title: 'My image', img_name: File.open(File.join(Rails.root, 'spec',
                                                                                                  'factories',
                                                                                                  'files',
                                                                                                  'rails.png')))
    4.times{@user.comments.create(body: 'nice comment', image_id: @image.id)}
    @comments = @user.comments
  end

  context 'index test' do
    it 'assigns @images' do
      get :index
      assert_template :index
      assert_template layout: 'layouts/application'
      assert_response :success
    end
  end

  context 'show test' do
    it 'assigns @image' do
      get :show, id: @image
      assert_template :show
      assert_template layout: 'layouts/application'
      assert_response :success
      assigns(:image).should eq(Image.last)
      Comment.count.should be 4
      assigns(:comments).include?(Comment.where('image_id = :id', id: @image.id).first).should be true
    end
  end

  context 'more comments' do
    it 'should load more comments' do
      post :more_comments, id: Image.first.id, page: 2, format: :json
      js_resp = (JSON.parse(response.body.to_s))[0]
      puts js_resp
      assert_response :success
    end
  end

end