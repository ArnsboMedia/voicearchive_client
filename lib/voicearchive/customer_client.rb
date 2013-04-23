require 'voicearchive/client'
module Voicearchive
  class CustomerClient < Client
    def get_customers(params={})
      params = set_simple_endpoint_default_values(params)
      response = call('customer', params)
      JSON.parse(response.body)
    end
  end
end
