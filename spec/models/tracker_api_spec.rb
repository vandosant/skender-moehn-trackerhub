require 'spec_helper'
require 'vcr'

describe TrackerApi do
  it 'returns project data for a given user' do
    VCR.use_cassette('sskender/projects') do
      tracker = TrackerApi.new
      actual = tracker.all_projects

      actualnames = actual.map { |project| project['name'] }

      expect(actualnames).to include("Scott Skender's Work")
      expect(actualnames).to include("Language App")
    end
  end

  it 'returns story data for a given project' do
    VCR.use_cassette('sskender/stories') do
      tracker = TrackerApi.new
      actual = tracker.all_stories(1072658)

      actualnames = actual.map { |story| story['name'] }

      expect(actualnames).to include("Create a mascot that shows in header")
      expect(actualnames).to include("Store all user search results in a words table")
    end
  end
end