require 'faraday'

class TrackerApi
  def all_projects
    get('/projects')
  end

  private

  def get(path)
    conn = Faraday.new(:url => "https://www.pivotaltracker.com/services/v5#{path}") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get do |req|
      req.headers['X-TrackerToken'] = ENV['XTRACKERTOKEN']
    end

    JSON.parse(response.body)
  end
end