.PHONY: all
all: build-greeter_server build-greeter_client push-greeter_server push-greeter_client

.PHONY: build-greeter_server
build-greeter_server:
	docker build -t greeter_server . -f ./greeter_server/Dockerfile && docker tag greeter_server aerfio/greeter_server:latest

.PHONY: build-greeter_client
build-greeter_client:
	docker build -t greeter_client . -f ./greeter_client/Dockerfile && docker tag greeter_client aerfio/greeter_client:latest

.PHONY: push-greeter_client
push-greeter_client:
	docker push aerfio/greeter_client:latest

.PHONY: push-greeter_server
push-greeter_server:
	docker push aerfio/greeter_server:latest