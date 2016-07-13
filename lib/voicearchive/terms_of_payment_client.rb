require 'voicearchive/client'

module Voicearchive
  class TermsOfPaymentClient < Client
    def all
      response = call('TermOfPayment')
      JSON.parse(response.body)
    end

    def update_terms_of_payment(id, params = {})
      response = call("TermOfPayment/#{id}", params, 'put')
      JSON.parse(response)
    end
  end
end
