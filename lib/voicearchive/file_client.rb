require 'voicearchive/client'
module Voicearchive
  class TaskClient < Client
    @@rest_path = ''
    def get_approved_files(task_id)
      call("/download/task/files/#{task_id}/approved")
    end
  end
end
