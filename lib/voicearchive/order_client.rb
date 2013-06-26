require 'voicearchive/client'
require 'voicearchive/task_client'
module Voicearchive
  class OrderClient < Client
    def get_order(order_id)
      response = call("orders/#{order_id}")
      JSON.parse(response.body)
    end

    def task_client
      @task_client ||= TaskClient.new(@api_key)
      @task_client
    end

    def task_with_order(task_id, customer_id=false)
      task = task_client.get_task(task_id)
      order = get_order(task['order_id'])
      if customer_id
        if order['customer'].to_i != customer_id.to_i
          raise 'Customer does not match'
        end
      end
      task['order'] = order
      task
    end
  end
end
