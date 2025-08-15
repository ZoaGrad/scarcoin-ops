SHELL := /bin/bash

up:
	docker compose --env-file .env up -d --build

down:
	docker compose down -v

logs:
	docker compose logs -f --tail=200

reset: down up

seed:
	./scripts/seed-demo.sh

k8s-install:
	helm upgrade --install scarcoin k8s/helm -f k8s/values.example.yaml

k8s-uninstall:
	helm uninstall scarcoin
