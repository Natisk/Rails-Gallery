require 'spec_helper'

describe User do

  it 'orders by last name' do
    lindeman = User.create!(name: 'Lindeman', email: 'qwer@mail.ru', password: '12345678', password_confirmation: '12345678')
    chelimsky = User.create!(name: 'Chelimsky', email: 'asdf@mail.ru', password: '12345678', password_confirmation: '12345678')

    expect(User.order('created_at DESC')).to eq([chelimsky, lindeman])
  end

end