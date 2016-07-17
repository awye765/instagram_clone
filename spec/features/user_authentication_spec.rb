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

end
