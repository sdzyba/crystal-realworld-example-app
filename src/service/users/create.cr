require "crypto/bcrypt/password"

class Users::Create < ApplicationService
  private getter email : String?
  private getter username : String?
  private getter password : String?

  validate email, required: true
  validate username, required: true
  validate password, required: true

  def initialize(params : Hash(String, String))
    @email = params["email"]
    @username = params["username"]
    @password = params["password"]
  end

  def perform
    return Result(User).new(invalid_attributes) unless valid?

    user = UserRepository.new.create({ "email" => email, "username" => username, "encrypted_password" => Crypto::Bcrypt::Password.create(password.as(String)).to_s })

    if user.error?
      errors = {} of String => Array(String)
      user.errors.each do |error|
        column = error.column.nil? ? "base" : error.column.not_nil!
        errors[column] = [error.reason]
      end

      return Result(User).new(errors)
    end

    return Result(User).new(user)
  end
end
