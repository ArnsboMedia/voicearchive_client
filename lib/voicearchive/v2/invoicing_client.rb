require 'voicearchive/v2/client'
module Voicearchive
  module V2
    class InvoicingClient < Client
      def get_orders_for_invoicing
        response = call('invoicing')
        JSON.parse(response.body)
      end

      def mark_orders_invoiced orders
        response = call('invoicing', orders, 'put')
        JSON.parse(response.body)
      end
    end
  end
end
