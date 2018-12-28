require "clear"

require "../src/db/migrations/**"

Clear::SQL.init(Amber.settings.database_url)
Clear.logger.level = Amber.settings.logger.level
