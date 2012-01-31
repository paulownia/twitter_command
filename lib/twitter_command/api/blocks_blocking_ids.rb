class TwitterCommand::API
  def blocks_blocking_ids
    @client.get("/blocks/blocking_ids") 
  end
end
