require 'voicearchive/client'
module Voicearchive
  module V2
    class SupplierClient < Client
      def get_suppliers
        response = call('supplier')
        JSON.parse(response.body)
      end

      def get_supplier(id)
        response = call("supplier/#{id}")
        JSON.parse(response.body)
      end

      # ex. "get_supplier_currency(123)" matches "supplier/123/currency"
      def self.method_missing(method_sym, *arguments, &block)
        if method_sym.to_s =~ /^get_supplier_(.*)$/ && subtasks.include?(method_sym)
          response = call("supplier/#{arguments.first}/#{$1}")
          JSON.parse(response.body)
        else
          super
        end
      end

      def self.subtasks
        [
          :ages,
          :attribute,
          :availability,
          :categories,
          :country,
          :currency,
          :delivery,
          :demo,
          :demos,
          :document,
          :languages,
          :priorities,
          :types
        ]
      end
    end
  end
end
