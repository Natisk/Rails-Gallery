require 'spec_helper'

describe CategoriesController do

  before(:each) do
    @category = FactoryGirl.create(:category)
  end

  context 'index test' do
    it 'assigns @categories' do
      get :index
      assigns(:categories).include?(Category.last).should be true
      assert_template :index
      assert_template layout: 'layouts/application'
      assert_response :success
    end
  end

  context 'show test' do
    it 'assigns @category' do
      get :show, id: @category
      assert_template :show
      assert_template layout: 'layouts/application'
    end
  end

  context 'subscribe test' do
    it 'should subscribe for a category' do
      category = FactoryGirl.create(:category)
      user = FactoryGirl.create(:user)
      sign_in user
      post :subscribe, category_id: category, user_id: user
      event = Event.all
      Event.count.should eq(1)
      event.first.user_action.should eq('subscribed')
      post :unsubscribe, category_id: category, user_id: user
      event = Event.all
      Event.count.should eq(2)
      event.last.user_action.should eq('unsubscribed')
    end
  end

end