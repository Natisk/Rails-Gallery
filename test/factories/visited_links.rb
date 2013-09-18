# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visited_link do
    user_id 1
    link "MyString"
    created_at "2013-09-18 16:49:52"
  end
end
