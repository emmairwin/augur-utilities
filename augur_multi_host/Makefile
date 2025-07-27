COMPOSE = podman-compose
INSTANCES = 8
DOMAIN ?= sociallycompute.io
AUGUR_PATH ?= .

all: up

up: build
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

regen:
	python3 generate_compose.py $(AUGUR_PATH)

build:
	$(COMPOSE) build

nginx:
	python3 generate_nginx.py $(DOMAIN)

certbot:
	sudo certbot --nginx $(shell seq -f "-d augur%g.$(DOMAIN)" 1 $(INSTANCES))