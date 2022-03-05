CONTAINER_NAME=arch_zabbix_build


all: container
	docker run --rm -it -u $$(id -u) -v $$(pwd):/data $(CONTAINER_NAME)

container:
	# send only the docker directory as the build context
	docker build -t $(CONTAINER_NAME) -f Dockerfile ./docker

clean:
	rm -rf src pkg *pkg.tar.zst
