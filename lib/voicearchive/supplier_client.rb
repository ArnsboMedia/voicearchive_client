require 'voicearchive/client'
module Voicearchive
  class SupplierClient < Client
    def get_supplier_search_options
      response = call('supplier/form-schema')
      JSON.parse(response.body)
    end

    def get_supplier_languages
      response = call('supplier/languages')
      JSON.parse(response.body)
    end

    def get_suppliers
      response = call('supplier', {:includeRelations=>1})
      JSON.parse(response.body)
    end

    def search_suppliers(params)
      params[:includeRelations] = 1
      response = call('supplier', params)
      JSON.parse(response.body)
    end

    def get_supplier_demo_types()
      params = set_simple_endpoint_default_values({})
      response = call('supplierpromotype', params)
      JSON.parse(response.body)
    end
  end
end
