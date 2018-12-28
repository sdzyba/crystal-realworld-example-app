class UserRepository
  def create(params : Hash(String, String | Nil)) : User
    user = User.new(params)

    begin
      user.save
    rescue ex : PQ::PQError
      case ex.message
      when "duplicate key value violates unique constraint \"users_email\""
        user.add_error("email", "already taken")
      when "duplicate key value violates unique constraint \"users_username\""
        user.add_error("username", "already taken")
      else
        raise ex
      end
    end

    return user
  end
end
