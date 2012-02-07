require "twitter_command/client"

module TwitterCommand
  class API

    def initialize 
      @client = TwitterCommand::Client.new
    end

    def method_missing(name)
      begin
        sym = name.to_s.split("_").map{|n| n.capitalize }.join.to_sym
        clazz = self.class.const_get(sym)
        clazz.new(@client)
      rescue
        super
      end
    end

    # api method implemantations
    autoload :Followers, "twitter_command/api/followers"
    autoload :Friends, "twitter_command/api/friends"
    autoload :Users, "twitter_command/api/users"
    autoload :Friendships, "twitter_command/api/friendships"
    autoload :Blocks, "twitter_command/api/blocks"
    autoload :Help, "twitter_command/api/help"
    
    class Base
      def initialize client
        @client = client
      end
    end
  end
end


