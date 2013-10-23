FactoryGirl.define do

  factory :user do
    email 'asdf@mail.ru'
    password '12345678'
    password_confirmation '12345678'
    name 'Test Usver'
  end

end