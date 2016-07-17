require 'rails_helper'

feature 'Can view individual posts' do

  before do
    user = create(:user)
    @post = create(:post, user_id: user.id)
    sign_in_with user
  end

  scenario 'Can click and view a single post' do
    find(:xpath, "//a[contains(@href,'posts/#{@post.id}')]").click
    expect(page.current_path).to eq(post_path(@post))
  end

end
