require 'rails_helper'

feature 'Deleting posts' do
  before do
    user_one = create :user
    user_two = create(:user, email: 'hi@hi.com',
                             user_name: 'BennyBoy',
                             id: user_one.id + 1)

    @post_one = create(:post, caption: 'Abs for days', user_id: user_one.id)
    @post_two = create(:post, caption: 'My dinner is great', user_id: user_one.id + 1)

    sign_in_with user_one
  end

  scenario 'can delete a single post as the owner' do
    find(:xpath, "//a[contains(@href,'posts/#{@post_one.id}')]").click
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page).to have_content('Problem solved! Post deleted.')
    expect(page).to_not have_content('Abs for days.')
  end

  scenario "cannot delete a post that doesn't belong to you via the show page" do
    find(:xpath, "//a[contains(@href,'posts/#{@post_two.id}')]").click
    expect(page).to_not have_content('Edit Post')
  end

  scenario "cannot delete a post that doesn't belong to you via url path" do
    visit "/posts/#{@post_two.id}/edit"
    expect(page.current_path).to eq root_path
    expect(page).to have_content("That post doesn't belong to you!")
  end

end
