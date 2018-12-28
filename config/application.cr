require "./database.cr"

require "amber"
require "../src/db/model/**"
require "../src/db/repository/**"
require "../src/service/**"
require "../src/serializer/**"

require "../src/controller/application_controller"
require "../src/controller/**"

Amber::Server.configure do |settings|
  settings.name = "Conduit"
  settings.logging.colorize = true
  settings.logging.severity = ENV["LOGGING_SEVERITY"]? ? ENV["LOGGING_SEVERITY"] : "debug"
  settings.logging.filter = ["password", "confirm_password"]
  settings.logging.context = ["request"]
  settings.secret_key_base = ENV["SECRET_KEY_BASE"] if ENV["SECRET_KEY_BASE"]?
  settings.host = ENV["HOST"]? ? ENV["HOST"] : "0.0.0.0"
  settings.port = ENV["PORT"]? ? ENV["PORT"].to_i : 3000
  settings.port_reuse = false
  settings.process_count = 1
  settings.database_url = ENV["DATABASE_URL"] if ENV["DATABASE_URL"]?
end
