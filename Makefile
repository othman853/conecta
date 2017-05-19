LOCAL_PORT=9000
DOCKER_PORT=9000

build-docker:
	docker build -t conecta-runner:latest .

run:build-docker
	docker run \
		--volume $(shell pwd):/usr/app \
		--publish $(LOCAL_PORT):$(DOCKER_PORT) \
		conecta-runner:latest \
			shotgun --host 0.0.0.0 --port $(DOCKER_PORT) config.ru

run-detached:build-docker
	docker run \
		-d \
		--volume $(shell pwd)/app:/usr/app \
		--volume $(shell pwd)/config:/usr/app \
		--volume $(shell pwd)/config.ru:/usr/app \
		--publish $(LOCAL_PORT):$(DOCKER_PORT) \
		conecta-runner:latest \
			shotgun --host 0.0.0.0 --port $(DOCKER_PORT) config.ru
