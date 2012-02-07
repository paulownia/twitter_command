class TwitterCommand::API
class Help < Base
  def test
    @client.get("/help/test")
  end
end
end

