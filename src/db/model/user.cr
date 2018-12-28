require "jwt"

class User
  include Clear::Model
  self.table = "users"

  with_serial_pkey

  column email : String
  column encrypted_password : String
  column username : String?
  column image : String?
  column bio : String?

  timestamps

  def generate_token
    # TODO: is Time.now utc?
    exp = (Time.now + 14.days).to_unix
    payload = { "id" => id, "exp" => exp }

    JWT.encode(payload, Amber.settings.secret_key_base, "HS256")
  end
end
