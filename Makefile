# Default domain can be overridden
DOMAIN=myapi.cloudbees

.PHONY: build up down logs

build:
	docker-compose build --build-arg DOMAIN=$(DOMAIN)

up: build
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f
