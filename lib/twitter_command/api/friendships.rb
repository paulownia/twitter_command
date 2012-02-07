class TwitterCommand::API
class Friendships < Base
  def no_retweet_ids
    @client.get("/friendships/no_retweet_ids")
  end
end
end
