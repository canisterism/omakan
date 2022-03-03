require 'rails_helper'

RSpec.describe DomainClient, type: :model do
  describe 'request_status' do
    it 'returns the status of the request' do
      # context 'when the domain is valid' do
      #   domain = 'example.com'
      #   client = DomainClient.new(domain)
      #   expect(client.request_status).to eq(200)
      # end

      context 'when the domain is invalid' do
        domain = 'domain-not-exist.com'
        client = DomainClient.new(domain)
        expect(client.request_status).to eq(nil)
      end
    end
  end
end
