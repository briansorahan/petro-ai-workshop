IMG   = bsorahan/jupyter
NAME ?= petro-ai-workshop

all: image

clean:
	rm -rf .image

image: .image

.image: Dockerfile
	@docker build -t $(IMG) .

push: image
	@docker push $(IMG)

start: image
	@docker run --rm -v $(shell pwd):/root -w /root \
           -p 8888 --name $(NAME) $(IMG) notebook --ip=0.0.0.0 --port=8888 --allow-root

stop:
	@docker rm -f $(NAME)

.PHONY: all clean image push
