require 'voicearchive/client'

module Voicearchive
  class CommonClient < Client
    attr_accessor :endpoint

    def all(params = {})
      params = set_simple_endpoint_default_values(params)
      response = call("#{@endpoint}", params, 'get')
      JSON.parse(response.body)
    end

    def find(id, params = {})
      params = set_simple_endpoint_default_values(params)
      response = call("#{@endpoint}/#{id}", params, 'get')
      JSON.parse(response.body)
    end

    def create(params = {})
      response = call(@endpoint, params, 'post')
      JSON.parse(response.body)
    end

    def update(id, params = {})
      response = call("#{@endpoint}/#{id}", params, 'put')
      JSON.parse(response.body)
    end

    def destroy(id)
      response = call("#{@endpoint}/#{id}", params, 'delete')
      JSON.parse(response.body)
    end
  end
end
