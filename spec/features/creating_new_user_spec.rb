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

  scenario "requires a user name to be more than 4 characters" do
    fill_in 'Email', with: 'syxrailsdev@gmail.com'
    fill_in 'User name', with: 'bob'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("is too short (minimum is 4 characters)")
  end

  scenario "requires a user name to be less than 4 characters" do
    fill_in 'Email', with: 'syxrailsdev@gmail.com'
    fill_in 'User name', with: 'bobbbbbbbbbbbbbbbbbbbbbbbbb'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("is too long (maximum is 16 characters)")
  end

  scenario "requires a password" do
    fill_in 'Email', with: 'syxrailsdev@gmail.com'
    fill_in 'User name', with: 'bobby'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")

  end

  scenario "requires a password to be 6 characters or more" do
    fill_in 'Email', with: 'syxrailsdev@gmail.com'
    fill_in 'User name', with: 'bobby'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'

    click_button 'Sign up'
    find('span.help-block').should have_content("is too short (minimum is 6 characters)")
    # expect(page).to have_content("is too short (minimum is 6 characters")

  end

  scenario "requires password and passowrd confirmation to be matching" do
    fill_in 'Email', with: 'syxrailsdev@gmail.com'
    fill_in 'User name', with: 'bobby'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password2'

    click_button 'Sign up'
    expect(page).to have_content("doesn't match Password")

  end


end
