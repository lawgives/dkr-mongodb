# Makefile for creating container file
# Override these with environmental variables
VERSION?=3.4.0
FULL_VERSION?=3.4.0-legalio-0

### Do not override below

registry=docker.io
user=legalio
app=mongodb
version=$(VERSION)

fq_image_name=$(registry)/$(user)/$(app)

all: container

container:
	docker build --tag=$(fq_image_name):$(version) --tag=$(fq_image_name):$(FULL_VERSION) --tag=$(fq_image_name):latest .

push:
	docker push $(fq_image_name):$(version)
	docker push $(fq_image_name):$(FULL_VERSION)

push-latest:
	docker push $(fq_image_name):latest

push-all: push push-latest

.PHONY: all container push push-latest push-all
