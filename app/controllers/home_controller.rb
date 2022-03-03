class HomeController < ApplicationController
  def index; end

  def search
    responses = DomainHealthCheck::Client.new(requested_domain).check
    render json: { responses: }
  rescue DomainHealthCheck::DomainNotFound
    render json: {
      error: 'DomainNotFound',
      message: 'ドメインが見つかりませんでした。存在しないドメインかもしれません...'
    }
  end

  private

  def requested_domain
    request.path.delete_prefix('/search/')
  end
end
