require 'voicearchive/client'
require 'voicearchive/task_client'

module Voicearchive
  class OrderClient < Client
    def get_orders(params = {})
      response = call("order", params)
      JSON.parse(response.body)
    end

    def get_order(order_id, params = {})
      response = call("order/#{order_id}", params)
      JSON.parse(response.body)
    end

    def update_order(order_id, params = {})
      response = call("order/#{order_id}", params, 'put')
      JSON.parse(response.body)
    end

    def get_order_tasks(order_id, params = {})
      response = call("order/#{order_id}/tasks", params)
      JSON.parse(response.body)
    end

    def get_order_task(order_id, task_id, params = {})
      response = call("order/#{order_id}/tasks/#{task_id}", params)
      JSON.parse(response.body)
    end

    def update_order_task(order_id, task_id, params = {})
      response = call("order/#{order_id}/tasks/#{task_id}", params, 'put')
      JSON.parse(response.body)
    end

    def task_with_order(task_id, customer_id=false)
      task = task_client.get_task(task_id)
      order = get_order(task['orderid'].to_i)
      if customer_id
        if order['customer'].to_i != customer_id.to_i
          raise 'Customer does not match'
        end
      end
      task['order'] = order
      task
    end

    def count_orders(options = {})
      options[:count] = true
      response = call('order', options, 'get')

      json = JSON.parse(response.body)
      return json unless json.key?('count')
      json['count'].to_i
    end

    def get_products(order_id)
      response = call("order/#{order_id}/products")
      JSON.parse(response.body)
    end

    def get_services(order_id)
      response = call("order/#{order_id}/services")
      JSON.parse(response.body)
    end

    private

    def task_client
      @task_client ||= TaskClient.new(@api_key)
      @task_client
    end
  end
end
