require 'voicearchive/client'
module Voicearchive
  class TaskClient < Client
    def set_supplier_on_task(task_id, supplier_id)
      response = call("task/#{task_id}/SetSupplier", {:supplierId=>supplier_id}, 'put')
      JSON.parse(response.body)
    end
    def set_task_data(task_id, supplier_id, comments, script)
      response = call("task/#{task_id}/SetTaskData", {:supplierId=>supplier_id, :comments=>comments, :script=>script}, 'put')
      JSON.parse(response.body)
    end    
  end
end
