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

  valid_addresses = %w(charlie45@gmail.com wendyiosdsd34@gmail.com osidnfsoidf@hotmail.com)
  valid_addresses.each do |valid_email|
    it 'should accept only valid email addresses' do
      user.email = valid_email
      expect(user).to be_valid
    end
  end

  invalid_addresses = %w(charlie45@gmail,com wendyiosdsd34@@gmail.com 1-2/?@hotmail.com)
  invalid_addresses.each do |invalid_email|
    it "the email address #{invalid_email}" do
      user.email = invalid_email
      expect(user).not_to be_valid
    end
  end

  it 'should not accept a duplicated user' do
    dupped_user = user.dup
    dupped_user.email = user.email.upcase
    dupped_user.save
    expect(dupped_user).to_not be_valid
  end

  it 'should have a password with a minimum length' do
    user.password = '12345'
    user.save
    expect(user).to_not be_valid
  end

  it 'should have a password with a minimum length' do
    user.password = ''
    user.save
    expect(user).to_not be_valid
  end
end
