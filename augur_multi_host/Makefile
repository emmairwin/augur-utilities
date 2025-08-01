COMPOSE = podman-compose
INSTANCES = 8
DOMAIN = sociallycompute.io
INSTANCE ?= 1

all: up

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down --remove-orphans

regen:
	@echo "Cleaning old configuration..."
	rm -rf postgres
	mkdir -p postgres
	@for i in 1 2 3 4 5 6 7 8; do \
		mkdir -p postgres/augur$$i; \
		echo "listen_addresses = '*'" > postgres/augur$$i/postgresql.conf; \
		echo "host all all 0.0.0.0/0 md5" > postgres/augur$$i/pg_hba.conf; \
	done
	@echo "Rebuilding docker-compose.yml ..."
	python3 generate_compose.py

nginx:
	python3 generate_nginx.py $(DOMAIN)

certbot:
	sudo certbot --nginx $(shell seq -f "-d augur%g.$(DOMAIN)" 1 $(INSTANCES))

restart:
	$(COMPOSE) restart

# Open an interactive shell into the chosen augur instance
shell:
	$(COMPOSE) exec augur$(INSTANCE) /bin/bash

# Show logs for the chosen augur instance
logs:
	$(COMPOSE) logs -f augur$(INSTANCE)

# List all containers managed by this compose file
ps:
	$(COMPOSE) ps

# Show status of environment files for all instances
status:
	@echo "Environment files for Augur instances:"
	@for i in $$(seq 1 $(INSTANCES)); do \
		f=envs/augur$$i.env; \
		if [ -f $$f ]; then \
			echo "  $$f (exists)"; \
		else \
			echo "  $$f (MISSING)"; \
		fi; \
	done

# Force stop all containers on the system
stop-all:
	podman stop $$(podman ps -q)

clean-networks:
	-podman network ls --format "{{.Name}}" | grep augur_multi_host_augur | xargs -I {} podman network rm {}

nuke:
	-podman ps --all --format "{{.ID}} {{.Names}}" | grep augur_multi_host | awk '{print $$1}' | xargs podman rm -f
	-podman network ls --format "{{.Name}}" | grep augur_multi_host_augur | xargs podman network rm