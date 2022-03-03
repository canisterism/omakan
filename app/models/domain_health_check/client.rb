module DomainHealthCheck
  class Client
    def initialize(domain)
      @response_list = []
      @domain = domain
      @client = Faraday.new("https://#{@domain}/hoge") do |f|
        f.request :retry
        f.response :logger
        # TODO(canisterism): 401の時listが更新されていない
        f.response :response_recorder, @response_list
        f.response :raise_error
        f.response :follow_redirects
        f.adapter :net_http
      end
    end

    def check
      @client.get.status
      @response_list
    rescue Faraday::ClientError => e
      Rails.logger.error("Faraday::ClientError: #{e}")
      debugger
    rescue Faraday::ServerError => e
      Rails.logger.error("Faraday::ServerError: #{e}")
    rescue Faraday::ConnectionFailed => e # ドメインが存在しないケース
      Rails.logger.error("ConnectionFailed: #{e}")
      raise DomainNotFound
    rescue StandardError => e
      Rails.logger.error("StandardError: #{e}")
      e
    end
  end

  class DomainNotFound < StandardError; end
end
