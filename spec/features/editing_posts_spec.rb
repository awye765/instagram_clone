require 'rails_helper'

feature 'Editing posts' do

  before do
    post = create(:post)
    user = create(:user)
    sign_in_with user
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  scenario "It won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end

end
