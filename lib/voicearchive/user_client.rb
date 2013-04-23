require 'voicearchive/client'
module Voicearchive
  class UserClient < Client
    def get_coordinators
      response = call('coordinators')
      JSON.parse(response.body)
    end
  end
end
