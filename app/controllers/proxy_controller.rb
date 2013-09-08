class ProxyController < ApplicationController
  def get
    url = URI.parse(params["url"])
    result = Net::HTTP.get_response(url)
    send_data result.body
  end
end
