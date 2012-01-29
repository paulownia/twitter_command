class TwitterCommand::API
  def help_test
    @client.get("/help/test")
  end
end

