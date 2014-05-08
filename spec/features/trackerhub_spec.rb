require 'spec_helper'

feature "TrackerHub" do
  scenario "user can see all projects and view show page for project's stories" do
    VCR.use_cassette('sskender/projects') do
      visit '/'

      click_on 'View Projects'

      expect(current_url).to eq 'http://www.example.com/projects'
      expect(page).to have_link "Scott Skender's Work"
    end
    VCR.use_cassette('sskender/stories') do
      click_link "Language App"

      expect(current_url).to eq 'http://www.example.com/projects/1072658'

      expect(page).to have_content "Stories"
      expect(page).to have_content "Create a mascot that shows in header"
      expect(page).to have_content "Store all user search results in a words table"
    end
  end
end