require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "the flash should display once after the wrong information is supplied for password/email" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { password: '', email: ''}
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
