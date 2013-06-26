require 'active_support/core_ext/string/inflections'
module Voicearchive
  class Factory
    attr_reader :api_key
    def initialize api_key
      @api_key = api_key
    end

    def get_client name
      name = "#{name}_client"
      require "voicearchive/#{name}"
      constant_name = "Voicearchive::#{name.camelize}"
      constant_name.constantize.new(api_key)
    end
  end
end

