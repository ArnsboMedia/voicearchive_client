require "active_support/core_ext/object/to_query"
require "json"
require "net/http"
require "uri"
module Voicearchive
  class Client
    attr_reader :api_key
    attr_accessor :version


    @@host_name = 'system.voicearchive.com'
    @@rest_path = 'rest'
    @@auth_header = 'X-API-KEY'

    def initialize(api_key='', version=1)
      @api_key = api_key
      @version = version
    end

    def call(end_point, params={}, request_type="get")
      url = get_url_object(end_point)
      Net::HTTP.new(url.host, url.port).start do |http|
        http.request(self.send("get_#{request_type.downcase}_request".to_sym,url, params))
      end
    end

    def set_simple_endpoint_default_values(params)
      if not params.key?(:pageSize)
        params[:pageSize] = 10000000
      end
      params
    end

    private

    def get_url_object(end_point)
      URI.parse("https://#{@@host_name}/#{@@rest_path}/v#{@version.to_s}/#{end_point}/")
    end

    def get_get_request(url, params={})
      path = url.path.concat("?#{params.to_query}")
      request = Net::HTTP::Get.new(path)
      set_request_authentication(request)
    end

    def get_post_request(url, params={})
      request = Net::HTTP::Post.new(url.path)
      request.body = params.to_json
      set_request_authentication(request)
    end

    def get_put_request(url, params={})
      request = Net::HTTP::Put.new(url.path)
      request.body = params.to_json
      set_request_authentication(request)
    end

    def get_delete_request(url, params={})
      request = Net::HTTP::Delete.new(url.path)
      set_request_authentication(request)
    end

    def set_request_authentication(request)
      request.add_field(@@auth_header, @api_key)
      request
    end

  end
end
