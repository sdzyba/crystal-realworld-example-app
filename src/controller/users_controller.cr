class UsersController < ApplicationController
  def create
    return error 422, { "user" => ["is required"] } unless params.has_key?("user")

    result = Users::Create.new(params_for("user")).perform

    if result.successful?
      json Users::ShowSerializer.new(result.data).render
    else
      error 422, result.errors
    end
  end
end
