require 'spec_helper'

describe Comment do

  context 'relations & validations' do
    it {should belong_to(:user)}
    it {should belong_to(:image)}
    it {should validate_presence_of}
  end

end