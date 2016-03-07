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

      def method_missing(method_sym, *arguments, &block)
        subtask = method_sym.to_s.split('get_supplier_')[-1]
        if subtask.include?(subtask)
          response = call("supplier/#{arguments.first}/#{subtask}")
          JSON.parse(response.body)
        else
          super
        end
      end

      def subtasks
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
