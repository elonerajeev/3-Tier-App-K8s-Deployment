# Define variables for your Docker image
IMAGE_NAME ?= myimage
TAG ?= latest

# Target to build the Docker image
build:
	docker build -t ${IMAGE_NAME}:${TAG} .

# Target to run the Docker container
run:
	docker run -p 80:80 ${IMAGE_NAME}:${TAG}

# Target to stop and remove a running container (if exists)
stop:
	-docker stop ${IMAGE_NAME} || true
	-docker rm ${IMAGE_NAME} || true

# Target to remove the Docker image
clean: stop
	docker rmi ${IMAGE_NAME}:${TAG}

# Target to push the Docker image to a registry
push:
	docker push ${IMAGE_NAME}:${TAG}

# Phony targets prevent conflicts with files of the same name
.PHONY: build run stop clean push
