require 'rails_helper'
include UserSpecHelpers

RSpec.describe 'UsersSignups', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get signup_path
      expect(response).to have_http_status(200)
    end

    it 'should create a user with valid params' do
      expect_any_instance_of(User).to receive(:save).and_return(true)
      user_valid_params = { 'user' => { 'name' => 'charlie', 'email' => 'charlie@carlos.com', 'password' => 'Femputer18', 'password_confirmation' => 'Femputer18' } }
      post users_path, user_valid_params
    end

    it 'should have a session id after signing up' do
      user_valid_params = { 'user' => { 'name' => 'charlie', 'email' => 'charlie@barley.com', 'password' => 'bananas', 'password_confirmation' => 'bananas' } }
      post users_path, user_valid_params
      expect(is_logged_in?).to be true
    end

    it 'should not create a user with invalid params' do
      expect_any_instance_of(User).to receive(:save).and_return(false)
      user_params = { 'user' => { 'name' => '', 'email' => 'charlie@carlos.com', 'password' => 'ValadamirBrutin', 'password_confirmation' => 'ValadamirBrutin' } }
      post users_path, user_params
      expect(response).to render_template('shared/_error_messages')
    end
  end
end
