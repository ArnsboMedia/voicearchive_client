require 'voicearchive/client'
module Voicearchive
  class CustomerClient < Client
    def get_customers(params={})
      params = set_simple_endpoint_default_values(params)
      response = call('customer', params)
      JSON.parse(response.body)
    end
    def get_customer(id, params={})
      params = set_simple_endpoint_default_values(params)
      response = call("customer/#{id}", params)
      JSON.parse(response.body)
    end
    def update_customer(id, params = {})
      response = call("customer/#{id}", params, "put")
      JSON.parse(response.body)
    end
    def get_customer_contacts(customerId, params={})
      params = set_simple_endpoint_default_values(params)
      response = call("customer/#{customerId}/contacts", params)
      JSON.parse(response.body)
    end
    def get_customer_contact(id, params={})
      params = set_simple_endpoint_default_values(params)
      response = call("customercontact/#{id}", params)
      JSON.parse(response.body)
    end
  end
end
