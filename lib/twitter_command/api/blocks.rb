class TwitterCommand::API
class Blocks < Base
  def blocking_ids
    @client.get("/blocks/blocking_ids") 
  end
end
end
