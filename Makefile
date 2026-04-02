USER = memalhot
IMAGE_NAME = pytorch-ngl
TAG = latest
REGISTRY = quay.io/$(USER)
FULL_IMAGE = $(REGISTRY)/$(IMAGE_NAME):$(TAG)

build:
	podman build -t $(IMAGE_NAME):$(TAG) -f Containerfile .

run:
	podman run -it -p 8888:8888 $(IMAGE_NAME):$(TAG)

push:
	podman tag $(IMAGE_NAME):$(TAG) $(FULL_IMAGE)
	podman push $(FULL_IMAGE)

login:
	podman login quay.io

clean:
	podman rm $(IMAGE_NAME):$(TAG)