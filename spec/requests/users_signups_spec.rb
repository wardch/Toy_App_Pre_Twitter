require 'rails_helper'

RSpec.describe 'UsersSignups', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get signup_path
      expect(response).to have_http_status(200)
    end

    it 'should create a user with valid params' do
      expect_any_instance_of(User).to receive(:save).and_return(true)
      user_invalid_params = { 'user' => { 'name' => 'charlie', 'email' => 'charlie@carlos.com', 'password' => 'Femputer18', 'password_confirmation' => 'Femputer18' } }
      post users_path, user_invalid_params
    end

    it 'should create a user with valid params' do
      expect_any_instance_of(User).to receive(:save).and_return(false)
      user_params = { 'user' => { 'name' => '', 'email' => 'charlie@carlos.com', 'password' => 'Femputer18', 'password_confirmation' => 'Femputer18' } }
      post users_path, user_params
      expect(response).to render_template('shared/_error_messages')
    end
  end
end
