NAME = inception
DATA_PATH = /home/$(USER)/data/
COMPOSE_FILE = ./srcs/docker-compose.yml
PASS = 1234

USER := $(shell whoami)

.PHONY: all setup build up start down restart clean fclean re logs status help

all: build

setup:
	@mkdir -p $(DATA_PATH)database-files || true
	@mkdir -p $(DATA_PATH)wordpress-files || true

build: setup
	@docker compose -f $(COMPOSE_FILE) up -d --build || exit 1

up:
	@docker compose -f $(COMPOSE_FILE) up -d || exit 1

start:
	@docker compose -f $(COMPOSE_FILE) start || exit 1

down:
	@docker compose -f $(COMPOSE_FILE) down || exit 1

restart:
	@docker compose -f $(COMPOSE_FILE) restart || exit 1

clean: down
	@docker system prune -af --volumes 2>/dev/null || true

fclean: down
	@docker system prune -af --volumes 2>/dev/null || true
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q) 2>/dev/null || true; \
	fi
	@if [ -n "$$(docker image ls -q)" ]; then \
		docker rmi -f $$(docker image ls -q) 2>/dev/null || true; \
	fi
	@sudo rm -rf $(DATA_PATH) 2>/dev/null || true

re: fclean all

logs:
	@docker compose -f $(COMPOSE_FILE) logs -f

status:
	@docker compose -f $(COMPOSE_FILE) ps

