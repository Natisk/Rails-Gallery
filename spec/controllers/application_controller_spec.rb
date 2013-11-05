require 'spec_helper'

describe ApplicationController do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  context 'save user link' do
    it 'should save user link' do
      sign_in @user
      VisitedLink.count.should eq(0)
      visit root_path
      #VisitedLink.count.should eq(1)
    end
  end

end