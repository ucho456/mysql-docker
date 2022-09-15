.PHONY: help up exec down open openW openM
.DEFAULT_GOAL := help

up: ## Do docker compose up
	docker compose up -d

exec: ## Do docker exec
	docker exec -it mysql-docker bash

down: ## Do docker compose down
	docker compose down

open: ## Open phpmyadmin in linux
	xdg-open http://localhost:33077

openW: ## Open phpmyadmin in windows
	start http://localhost:33077

openM: ## Open phpmyadmin in mac
	open http://localhost:33077

help: ## Show options
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'