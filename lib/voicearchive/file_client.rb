require 'voicearchive/client'
module Voicearchive
  class FileClient < Client
    @@rest_path = ''
    def get_approved_files(task_id)
      call("/download/task/files/#{task_id}/approved")
    end
  end
end
