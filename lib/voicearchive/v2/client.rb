require 'voicearchive/client'

module Voicearchive
  module V2
    class Client < ::Voicearchive::Client
      def initialize(api_key = '', version = 2, host)
        super(api_key, version, host)
      end
    end
  end
end

