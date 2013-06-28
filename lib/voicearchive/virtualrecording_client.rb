require 'voicearchive/client'
module Voicearchive
  class VirtualrecordingClient < Client
    def get_virtual_recording id
      response = call("virtualrecording/#{id}", {:includeRelations=>1})
      JSON.parse(response.body)
    end
    def get_virtual_recordings
      response = call("virtualrecording", {:includeRelations=>1})
      JSON.parse(response.body)
    end
  end
end
