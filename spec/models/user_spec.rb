# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      default("uzver")
#  likes_count            :integer          default(0)
#  comments_count         :integer          default(0)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string(255)
#  uid                    :string(255)
#  oauth_token            :string(255)
#  oauth_expires_at       :datetime
#

require 'spec_helper'

describe User do

  it 'orders by last name' do
    lindeman = User.create!(name: 'Lindeman', email: 'qwer@mail.ru', password: '12345678', password_confirmation: '12345678')
    chelimsky = User.create!(name: 'Chelimsky', email: 'asdf@mail.ru', password: '12345678', password_confirmation: '12345678')

    expect(User.order('created_at DESC')).to eq([chelimsky, lindeman])
  end

end
