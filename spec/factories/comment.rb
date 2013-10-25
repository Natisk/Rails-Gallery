FactoryGirl.define do

  factory :comment do
    sequence :body do |n|
      "Comment_#{n}"
    end
    association :image, factory: :image
  end

end