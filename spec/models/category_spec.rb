require 'spec_helper'

describe Category do

  context 'relations and validations' do
    it {assert validate_presence_of(:title)}
    it { should have_many(:images).dependent(:destroy) }
  end

end