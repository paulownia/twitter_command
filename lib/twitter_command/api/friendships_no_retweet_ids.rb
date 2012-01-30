class TwitterCommand::API
  def friendships_no_retweet_ids
    @client.get("/friendships/no_retweet_ids")
  end
end
