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

    def create_retake(task_id, reason_id)
      response = call("task/#{task_id}/create-retake", {
        reasonId: reason_id
      }, 'put');

      JSON.parse(response.body)
    end

    def get_task(task_id)
      response = call("ordertask/#{task_id}")
      JSON.parse(response.body)
    end

    def get_tasks(search_options, options)
      response = call('ordertask', options.merge({
        search: search_options,
      }), 'get')

      JSON.parse(response.body)
    end

    def count_tasks(search_options)
      response = call("task", {
        count: true,
        search: search_options
      }, 'get')

      JSON.parse(response.body)["count"].to_i
    end
  end
end
