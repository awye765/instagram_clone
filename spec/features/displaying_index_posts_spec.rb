require 'rails_helper'

feature 'Index displays a list of posts' do

  scenario 'the index displays correct created job information' do
    job_one = create(:post, caption: "This is post no. 1")
    job_two = create(:post, caption: "This is post no. 2")

    visit '/'
    expect(page).to have_content("This is post no. 1")
    expect(page).to have_content("This is post no. 2")
    expect(page).to have_css("img[src*='coffee']")
  end
  
end
