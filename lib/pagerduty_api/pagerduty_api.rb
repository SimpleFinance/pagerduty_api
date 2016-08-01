# pagerduty_api.rb

require 'faraday'
require 'json'

class PagerdutyAPI

  def initialize(opts = {})
    @token = opts[:token]
    @conn  = Faraday.new(
      url: "https://api.pagerduty.com",
      headers: {
        Authorization: "Token token=#{@token}",
        Accept: "application/vnd.pagerduty+json;version=2"
      }
    ) do |f|
      f.adapter  opts.fetch(:adapter, Faraday.default_adapter)
      f.response :logger
    end
  end

  def get_notes(incident_id)
    response = @conn.get("/incidents/#{incident_id}/notes")
    return JSON.parse(response.body)
  end

  def create_note(incident_id, content, from)
    response = @conn.post do |req|
      req.url "/incidents/#{incident_id}/notes"
      req.headers['Content-Type'] = 'application/json'
      req.headers['From'] = from
      req.body = JSON.generate({
        note: {
          content: content
        }
      })
    end

    return JSON.parse(response.body)
  end
end
