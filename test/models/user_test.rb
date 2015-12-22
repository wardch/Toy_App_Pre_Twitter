require 'rails_helper'

describe User, type: :model do
  let(:user) do
    User.new(name: 'Example User',
             email: 'user232@example.com',
             password: 'I love me cheese')
  end

  it 'name should be present' do
    user.name = nil
    expect(user).not_to be_valid
end

  it 'name should be present' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'should have a maximum value for length of name' do
    user.name = 'C' * 51
    expect(user).not_to be_valid
  end

  it 'email address should not be over 255 characters' do
    user.email = 'c' * 246 + '@gmail.com'
    expect(user).not_to be_valid
  end

  it 'should'
end
