require 'rails_helper'

feature 'Index displays a list of posts' do

  before do
    post_one = create(:post, caption: "This is post no. 1")
    post_two = create(:post, caption: "This is post no. 2")
    user = create :user
    sign_in_with user
  end

  scenario 'the index displays correct created job information' do
    expect(page).to have_content("This is post no. 1")
    expect(page).to have_content("This is post no. 2")
    expect(page).to have_css("img[src*='coffee']")
  end

end
