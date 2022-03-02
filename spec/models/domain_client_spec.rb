require 'rails_helper'

RSpec.describe DomainClient, type: :model do
  describe 'request_status' do
    it 'returns the status of the request' do
      domain = 'example.com'
      client = DomainClient.new(domain)
      expect(client.request_status).to eq(200)
    end
  end
end
