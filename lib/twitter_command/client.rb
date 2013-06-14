require "rubygems"
require "oauth"
require "yaml"
require "json"
require "fileutils"

module TwitterCommand
  
  module PathUtil
    class << self
      def normalize(api)
        if api.nil? || !api.instance_of?(String) || api.size == 0
          return ""
        end
        if api[0, 1] != "/"
          api = "/" + api 
        end
        if api.rindex(".json") != api.size - 5
          api = api + ".json"
        end
        api
      end
    end
  end
  
  class Client

    AuthFile = File.expand_path(".twitter_command", "~")

    def initialize
      unless File.exist?(AuthFile)
        raise "TwitterCommand is not authorized. Type 'twitter init'"
      end

      File.open(AuthFile) do |f|
        data = YAML.load(f)

        consumer = OAuth::Consumer.new(
          data["consumer"]["key"],
          data["consumer"]["secret"],
          :site => "https://twitter.com/"
        )

        @twitter = OAuth::AccessToken.new(
          consumer,
          data["access_token"]["key"],
          data["access_token"]["secret"]
        )
      end
    end

    BaseURL = "https://api.twitter.com/1.1"

    def get(api, options = {})
      query = options.map { |k, v|
        k.to_s + "=" + v.to_s
      }.join("&")
      
      if query.length > 0 
        query = "?" + query
      end

      url = BaseURL + PathUtil.normalize(api) + query
      res = @twitter.get(url)
      if res.code != "200"
        raise TwitterCommand::ResponseError.new(url, nil, res, "not 200")
      end
      if !res.content_type.include?("json") 
        raise TwitterCommand::ResponseError.new(url, nil, res, "not json")
      end

      json = nil 
      begin
        json = JSON.parse(res.body)  
      rescue JSON::ParserError
        data = res.body
        json = JSON.parse("[#{data}]").first
      end
      
      if block_given? 
        yield json
      else
        json
      end
    end

    def to_s
      self.class.to_s
    end

    private 
    def normalize_api(api)
    end
  end

  class ResponseError < RuntimeError
    def initialize url, param, res, message 
      @message = message
      @url = url
      @param = param
      @response = res
    end

    def to_s
      "#{@url}: #{@response.code} #{@response.message}: #{@message}"
    end

    def response
      @response
    end
  end
end

