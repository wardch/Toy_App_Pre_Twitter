require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def set_up
    @user = User.new(name: "ward", email: "charlieward18@gmail.com", password: "1234", password_confirmation: "1234")
  end

  test 'user must be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be present and unique' do
    @user.email = ''
    asser_not @user.valid?
  end

  test 'email not be longer then 255 characters' do
    @user.email = "a"*255 + "@gmail.com"
    assert_not @user.valid?
  end

  test 'email address should be valid' do
    addresses = %w[hello@gmail.com charlieward18@gmail.com chuckyd3434@gmail.com asdf_casdf84@hotmail.com]
    addresses.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect}, is a valid email address"
    end
  end

  test 'email test should reject invalid email addresses' do
    invalid_emails = %w[user@gmail,com user@.com abba@com @hclair.gspot.com]
    invalid_emails.each do |bad_email|
      @user.email = bad_email
      assert_not @user.valid?, "#{bad_email.inspect}, is not a valid email address"
    end
  end

  test 'email address should be unique' do
    dupped_user = @user.dup
    dupped_user.email = @user.email.upcase
    @user.save
    assert_not dupped_user.valid?
  end

  test "user password should be non blank" do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "$"*5
    assert_not @user.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
