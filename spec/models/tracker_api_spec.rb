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
end