require 'voicearchive/client'
module Voicearchive
  class InvoicingClient < Client
    def get_orders_for_invoicing
      response = call('invoicing')
      JSON.parse(response.body)
    end

    def mark_orders_invoiced orders
      response = call('invoicing', orders, 'post')
      JSON.parse(response.body)
    end
  end
end
