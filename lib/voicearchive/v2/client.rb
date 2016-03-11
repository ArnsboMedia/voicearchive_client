require 'voicearchive/client'

module Voicearchive
  module V2
    class Client < ::Voicearchive::Client
      def initialize api_key='', version=2
        super api_key, version
      end
    end
  end
end

