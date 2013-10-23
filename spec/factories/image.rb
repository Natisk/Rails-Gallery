FactoryGirl.define do

  factory :image do
    title 'My image'
    img_name {File.open(File.join(Rails.root, 'spec', 'factories', 'files', 'rails.png'))}
  end

end