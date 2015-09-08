# require 'rspec/rails'
# require 'capybara/rspec'
# require 'capybara/rails'
require 'rails_helper'
  # test "the truth" do
desribe 'the login process', :type => :feature do

  before :each do
   User.make(:email => 'user@example.com', :password => 'password')
  end

  it 'should login a user with the corrent information' do
    visit '/login'
    within('#create') do
      fill_in 'email', :with => "user@example.com"
      fill_in 'password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_css('img', text: "#{User.name}")
  end
end
