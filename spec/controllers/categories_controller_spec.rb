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

end