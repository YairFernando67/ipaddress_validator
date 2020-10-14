require 'rails_helper'

RSpec.describe IpAddressesController, type: :request do

  before(:all) do
    @error_message = "Invalid Address"
  end

  describe 'GET /ip_addresses/validate' do
    it 'should return the ip_address' do
      params = {
        ip_addresses: {
          data: "128.55.66.25"
        }
      }
      get '/ip_addresses/validate', params: params
      expect(response.parsed_body).to eq(params[:ip_addresses][:data])
    end

    it 'should return the ip_addresses in plain text' do
      params = {
        ip_addresses: {
          data: ["128.55.66.25", "126.36.5.9", "255.255.255.255", "220.251.147.255"]
        }
      }
      get '/ip_addresses/validate', params: params
      expect(response.parsed_body).to eq(params[:ip_addresses][:data].join(', '))
    end

    it 'should return the invalid message' do
      params = {
        ip_addresses: {
          data: "128.55.66.25.22"
        }
      }
      get '/ip_addresses/validate', params: params
      expect(response.parsed_body).to eq(@error_message)
    end

    it 'should return the invalid message' do
      params = {
        ip_addresses: {
          data: "128.55"
        }
      }
      get '/ip_addresses/validate', params: params
      expect(response.parsed_body).to eq(@error_message)
    end

    it 'should return the invalid message' do
      params = {
        ip_addresses: {
          data: ""
        }
      }
      get '/ip_addresses/validate', params: params
      expect(response.parsed_body).to eq(@error_message)
    end

    it 'should return the invalid message' do
      params = {
        ip_addresses: {
          data: "126.365.555.900"
        }
      }
      get '/ip_addresses/validate', params: params
      expect(response.parsed_body).to eq(@error_message)
    end

    it 'should return the invalid message' do
      params = {
        ip_addresses: {
          data: ["128.555.66.25"]
        }
      }
      get '/ip_addresses/validate', params: params
      expect(response.parsed_body).to eq(@error_message)
    end
  end

end