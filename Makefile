IMAGE=reanahub/reana-env-aliphysics

all:
	@echo "Usage: make <action> where action is build, test, or push."

check-version:
ifndef ALIPHYSICS_VERSION
  $(error ALIPHYSICS_VERSION is not set. Please see the documentation)
endif

build: Dockerfile check-version
	docker build --build-arg ALIPHYSICS_VERSION=$(ALIPHYSICS_VERSION) -t $(IMAGE):$(ALIPHYSICS_VERSION) .

test: check-version
	docker run -i -t --rm $(IMAGE):$(ALIPHYSICS_VERSION) root-config --version | grep -q ^5

push: check-version
	docker push $(IMAGE):$(ALIPHYSICS_VERSION)
