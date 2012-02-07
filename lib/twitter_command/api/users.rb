class TwitterCommand::API
class Users < Base
  def lookup(ids, config = {})
    if ids.size == 0
      return []
    end

    result = []
    ids.each_slice(100) do |ids100|
      @client.get("/users/lookup", "user_id" => ids100.join(",")) do |json|
        json.each { |user|
          result << user["screen_name"]
        }
      end
    end
    result
  end
end
end
