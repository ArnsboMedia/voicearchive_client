require 'voicearchive/client'
module Voicearchive
  class InvoicingClient < Client
    def get
      response = call('invoicing')
      JSON.parse(response.body)
    end
  end
end
