class ResponseRecorder < Faraday::Middleware
  # @param app [#call]
  # @param response_list [Array] Array to store responses
  def initialize(app, response_list)
    @response_list = response_list
    super(app)
  end

  def on_complete(env)
    record_response(env)
  end

  def record_response(response)
    @response_list << {
      status: response[:status],
      domain: response[:url].host
    }
  end
end
