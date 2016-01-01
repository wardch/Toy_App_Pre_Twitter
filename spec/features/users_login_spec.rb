require 'rails_helper'
include UserSpecHelpers

describe 'the login process', type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password', name: 'charlie')
  end

  it 'should login a user with the corrent information then log out correctly' do
    visit '/login'
    fill_in 'session[email]', with: 'user@example.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Login'
    expect(page).to have_css('img[alt=charlie]')
    find("a[href='#{logout_path}']").click
    expect(body).to have_content('Static Pages Home Yo')
  end

  it 'should display the corrent flash for invalid login' do
    visit '/login'
    fill_in 'session[email]', with: 'user@example.com'
    fill_in 'session[password]', with: 'wrongpassword'
    click_button 'Login'
    expect(page.body).to have_content('Invalid email/password combination')
    fill_in 'session[email]', with: 'user@example.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Login'
    expect(page).to have_css('img[alt=charlie]')
  end
end
