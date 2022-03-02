class HomeController < ApplicationController
  def index; end

  def search
    status = DomainClient.new(requested_domain).request_status
    render json: { status: }
  end

  private

  def requested_domain
    request.path.delete_prefix('/search/')
  end
end
