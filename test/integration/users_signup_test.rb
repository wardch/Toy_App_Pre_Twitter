require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup info" do
      get signup_path
      assert_no_difference "User.count" do
      post users_path, user: {
        name: "",
        email: "invalid@cheese",
        password: "chuck",
        password_confirmation: "bones"
      }
      assert_template "users/new"
    end
  end

  test 'valid signup information' do
    get signup_path
    assert_difference "User.count", 1 do
      post_via_redirect users_path, user: {
        name: "charlie",
        email: "charlie@charlie.com",
        password: "password",
        password_confirmation: "password"
      }
    end
    assert_template "users/show"
  end

end
