tag = 0.1

image:
	docker build -t ghcr.io/metacontroller/example-jsonnetd:$(tag) .

push: image
	docker push ghcr.io/metacontroller/example-jsonnetd:$(tag)
