require 'rails_helper'

feature 'User authentication' do

  before do
    @user = create(:user)
  end

  scenario "can log in from the index" do
    visit '/'
    expect(page).to_not have_content('New Post')

    sign_in_with @user

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end

  scenario 'can log out once logged in' do
    visit '/'
    sign_in_with @user
    click_link 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

  scenario 'cannot view index posts without logging in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot create a new post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end
