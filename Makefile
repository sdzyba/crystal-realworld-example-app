.PHONY: start
start:
	@amber watch

.PHONY: db-create
db-create:
	@amber db create

.PHONY: db-drop
db-drop:
	@amber db drop

.PHONY: db-migrate
db-migrate:
	@crystal run src/db_cli.cr -- migrate

.PHONY: db-rollback
db-rollback:
	@crystal run src/db_cli.cr -- migrate rollback

.PHONY: generate-migration
# Example:
# 	$ make generate-migration n="CreateTable"
generate-migration:
	@crystal run src/db_cli.cr -- generate migration ${n}
