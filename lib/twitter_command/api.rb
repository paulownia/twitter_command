require "twitter_command/client"

module TwitterCommand
  class API
    def initialize 
      @client = TwitterCommand::Client.new
    end
  end
end

 # api method implemantations
require "twitter_command/api/followers_ids"
require "twitter_command/api/friends_ids"
require "twitter_command/api/help_test"
require "twitter_command/api/users_lookup"
require "twitter_command/api/friendships_no_retweet_ids"

