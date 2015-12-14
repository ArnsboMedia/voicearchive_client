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
    def get_customer_contacts(id, params={})
      params = set_simple_endpoint_default_values(params)
      response = call("customer/#{id}/contacts", params)
      JSON.parse(response.body)
    end
    def get_customer_contact(customer_id, contact_id, params={})
      response = call("customer/#{customer_id}/contacts/#{contact_id}", params)
      JSON.parse(response.body)
    end
    def update_customer_contact(customer_id, contact_id, params={})
      response = call("customer/#{customer_id}/contacts/#{contact_id}", params, "put")
      JSON.parse(response.body)
    end
  end
end
