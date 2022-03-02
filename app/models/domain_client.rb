class DomainClient
  def initialize(domain)
    @domain = domain
    @client = Faraday.new("https://#{@domain}") do |f|
      f.request :retry
      f.response :follow_redirects
      f.adapter :net_http
    end
  end

  def request_status
    @client.get.status
  end
end
