require 'rails_helper'

feature 'Editing posts' do

  before do
    user_one = create(:user)
    user_two = create(:user, email: 'hi@hi.com',
                             user_name: 'BennyBoy',
                             id: user_one.id + 1)

    @post_one = create(:post, user_id: user_one.id)
    @post_two = create(:post, user_id: user_one.id + 1)

    sign_in_with user_one

  end

  scenario 'can edit a post as the owner' do
    find(:xpath, "//a[contains(@href,'posts/#{@post_one.id}')]").click
    expect(page).to have_content('Edit Post')

    click_link 'Edit Post'
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

    scenario "cannot edit a post that doesn't belong to you via the show page" do
      find(:xpath, "//a[contains(@href,'posts/#{@post_two.id}')]").click
      expect(page).to_not have_content('Edit Post')
    end

    scenario "cannot edit a post that doesn't belong to you via url path" do
      visit "/posts/#{@post_two.id}/edit"
      expect(page.current_path).to eq root_path
      expect(page).to have_content("That post doesn't belong to you!")
    end

  scenario "It won't update a post without an attached image" do
    find(:xpath, "//a[contains(@href,'posts/#{@post_one.id}')]").click
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end

end
