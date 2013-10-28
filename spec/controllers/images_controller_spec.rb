require 'spec_helper'

describe ImagesController do

  before(:each) do
    user = FactoryGirl.create(:user)
    @category = FactoryGirl.create(:category)
    @image = @category.images.create(title: 'My image', img_name: File.open(File.join(Rails.root, 'spec',
                                                                                                   'factories',
                                                                                                   'files',
                                                                                                   'rails.png')))
    4.times{user.comments.create(body: 'nice comment', image_id: @image)}
    @comments = @image.comments
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
      assigns(:comments).include?(Comment.where('image_id = :id', id: @image)).should be true
    end
  end

  context 'more comments' do
    it 'should load more comments' do
      post :more_comments, image_id: Image.first, format: :json
      js_resp = (JSON.parse(response.body))[0]
      puts js_resp.class
      puts Comment.first.body
      puts Comment.count
      assert_response :success
    end
  end

end