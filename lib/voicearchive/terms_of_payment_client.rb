require 'voicearchive/client'

module Voicearchive
  class TermsOfPaymentClient < Client
    def all
      response = call('TermOfPayment')
      JSON.parse(response.body)
    end
  end
end
