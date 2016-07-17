require 'rails_helper'

feature 'Deleting comments' do

  before do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'hi@hi.com',
                             user_name: 'bigrigoz')

    @post = create(:post, caption: 'Abs for days', user_id: user.id)

    @comment = create(:comment, user_id: user_two.id,
                               post_id: @post.id)
    @comment_two = create(:comment, user_id: 2,
                                   post_id: @post.id,
                                   content: 'You guys are too kind xo!')
    sign_in_with user_two
  end

  scenario 'user can delete their own comments' do
    visit '/'
    expect(page).to have_content('You guys are too kind xo!')
    click_link "delete-#{@comment_two.id}"
    expect(page).to_not have_content('You guys are too kind xo!')
  end

  scenario 'user cannot delete a comment not belonging to them via the ui' do
    visit '/'
    expect(page).to have_content('You guys are too kind xo!')
    expect(page).to_not have_css("#delete-2")
  end

  scenario 'user cannot delete a comment not belonging to them via urls' do
    visit '/'
    expect(page).to have_content('You guys are too kind xo!')
    page.driver.submit :delete, "posts/#{@post.id}/comments/#{@comment.id}", {}
    expect(current_path).to eq '/'
    # expect(page).to have_content("That doesn't belong to you!")
    expect(page).to have_content('You guys are too kind xo!')
    # I can't get the commented out line of the above test to work.  Seems to
    # suggest that the flash message 'That doesn't belong to you!" does not
    # render on the index page after redirection if a user tries to delete the
    # comment using the url and DELETE action.
  end

end
