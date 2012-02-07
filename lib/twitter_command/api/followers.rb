class TwitterCommand::API
class Followers < Base
  def ids config = {}
    user_ids = []
    param = {
      :stringify => true
    }
    count = config["limit"] || 1
    count.times do
      result = @client.get("/followers/ids", param) do |json|
        user_ids.concat(json["ids"])
        json
      end
      if result["next_cursor"].nil? || result["next_cursor"] == 0 then
        break
      end
      param["cursor"] = result["next_cursor_str"]
    end
    user_ids
  end
end
end
