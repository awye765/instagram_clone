require 'rails_helper'

feature "Creating a new user" do

  before do
    visit '/'
    click_link "Register"
  end

  scenario "can create a new user via the index page" do
    fill_in 'Email', with: 'syxrailsdev@gmail.com'
    fill_in 'User name', with: 'sxyrailsdev'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  scenario "requires a user name to successfully create an account" do
    fill_in 'Email', with: 'syxrailsdev@gmail.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

end
