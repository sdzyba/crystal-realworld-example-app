require "./spec_helper"
require "../../src/models/user.cr"

describe User do
  Spec.before_each do
    Repo.delete_all(User)
  end
end
