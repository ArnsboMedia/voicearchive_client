require 'voicearchive/client'

module Voicearchive
  class TermsOfPaymentClient < Client
    def all(params = {})
      params = set_simple_endpoint_default_values(params)
      response = call('TermOfPayment', params)
      JSON.parse(response.body)
    end

    def update_terms_of_payment(id, params = {})
      response = call("TermOfPayment/#{id}", params, 'put')
      JSON.parse(response.body)
    end
  end
end
