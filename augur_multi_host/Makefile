COMPOSE = podman compose
INSTANCES = 8
DOMAIN = sociallycompute.io
INSTANCE ?= 1

all: up

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

regen:
	python3 generate_compose.py $(AUGUR_PATH)

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