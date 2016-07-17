require 'rails_helper'

feature 'Deleting posts' do
  before do
    user = create :user
    post = create(:post, caption: 'Abs for days', user_id: user.id)
    sign_in_with user
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
  end

  scenario 'Can delete a single post' do
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page).to have_content('Problem solved! Post deleted.')
    expect(page).to_not have_content('Abs for days.')
  end

end
