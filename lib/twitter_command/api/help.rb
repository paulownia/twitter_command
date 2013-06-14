class TwitterCommand::API
class Help < Base
  def test
    $stderr.puts "This method is for ver 1.0, no longer supported."
    # @client.get("/help/test")
  end
end
end

