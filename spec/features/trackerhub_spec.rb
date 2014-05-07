require 'spec_helper'

feature "TrackerHub" do
  scenario "user can see a list of all projects" do
    VCR.use_cassette('sskender/projects') do
      visit '/'

      click_on 'View Projects'
      expect(page).to have_content "Scott Skender's Work"
      expect(page).to have_content "Language App"
    end
  end
end