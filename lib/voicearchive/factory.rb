require 'active_support/core_ext/string/inflections'
module Voicearchive
  class Factory
    attr_reader :api_key
    def initialize api_key
      @api_key = api_key
    end

    def get_client name
      name = name.to_s # allow symbols to be stringified
      name = "#{name}_client" # suffix with client
      require "./voicearchive/#{name}" # require the file
      constant_name = "Voicearchive::#{name.camelize}" # the constant name of the class (in the Voicearchive module)
      constant_name.constantize.new(api_key) # return the new class, with the correct api_key
    end
  end
end

