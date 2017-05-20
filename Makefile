LOCAL_PORT=9000
DOCKER_PORT=9000

build-docker:
	docker build -t conecta-runner:latest .

run:build-docker
	docker run \
		--volume $(shell pwd)/app:/usr/app/app \
		--volume $(shell pwd)/config:/usr/app/config \
		--volume $(shell pwd)/config.ru:/usr/app/config.ru \
		--volume $(shell pwd)/config.rb:/usr/app/config.rb \
		--volume $(shell pwd)/Rakefile:/usr/app/Rakefile \
		--volume $(shell pwd)/public:/usr/app/public \
		--volume $(shell pwd)/csv:/usr/app/csv \
		--publish $(LOCAL_PORT):$(DOCKER_PORT) \
		--name conecta-runner \
		conecta-runner:latest \
			shotgun --host 0.0.0.0 --port $(DOCKER_PORT) config.ru

run-detached:build-docker
	docker run \
		-d \
		--volume $(shell pwd)/app:/usr/app/app \
		--volume $(shell pwd)/config:/usr/app/config \
		--volume $(shell pwd)/config.ru:/usr/app/config.ru \
		--volume $(shell pwd)/config.rb:/usr/app/config.rb \
		--volume $(shell pwd)/Rakefile:/usr/app/Rakefile \
		--volume $(shell pwd)/public:/usr/app/public \
		--volume $(shell pwd)/csv:/usr/app/csv \
		--publish $(LOCAL_PORT):$(DOCKER_PORT) \
		--name conecta-runner \
		conecta-runner:latest \
			shotgun --host 0.0.0.0 --port $(DOCKER_PORT) config.ru
