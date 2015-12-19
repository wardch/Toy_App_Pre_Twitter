require 'rails_helper'

  describe 'the login process', :type => :feature do

    before :each do
     User.create(:email => 'user@example.com', :password => 'password', name: 'charlie')
    end


    it 'should login a user with the corrent information' do
      visit '/login'
      fill_in 'session[email]', :with => "user@example.com"
      fill_in 'session[password]', :with => 'password'
      click_button 'Login'

      expect(page).to have_css("img[alt=charlie]")
    end

    it 'should logout a user too' do
    visit '/login'
    fill_in 'session[email]', :with => "user@example.com"
    fill_in 'session[password]', :with => 'password'
    click_button 'Login'
    click_link 'Account'
    click_link 'Log Out'
    expect(page).to have_link('Sign up now!')
    expect(page).to have_link('Log In')
    end

end
