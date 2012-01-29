class TwitterCommand::API
  def followers_ids config = {}
    user_ids = []
    param = {
      :stringify => true
    }
    count = config["limit"] || 1
    count.times do
      @client.get("/followers/ids", param) do |json|
        user_ids.concat(json["ids"])
      end
      if result["next_cursor"].nil? || result["next_cursor"] == 0 then
        break
      end
      param["cursor"] = result["next_cursor_str"]
    end
    user_ids
  end
end
