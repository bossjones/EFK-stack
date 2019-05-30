clean:
	rm -rfv data/nodes*

up: clean
	docker-compose up

down:
	docker-compose down

start-no-clean:
	docker-compose up -d elasticsearch
	docker-compose up -d kibana

start: clean
	docker-compose up -d elasticsearch
	docker-compose up -d kibana

.PHONY: fluentd
fluentd:
	docker-compose up fluentd

restart: down start fluentd

curator:
	docker-compose -f docker-compose.curator.yml up curator

build-curator:
	docker-compose -f docker-compose.curator.yml build curator
