require 'spec_helper'

describe Category do

  context do
    it {should validate_presence_of(:title)}
  end

end