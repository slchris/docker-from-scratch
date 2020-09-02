# Makefile
# author chris <chris@lesscrowds.org>


all:
	make generate
	make build
build:
	docker build --tag hello .

vmbuild:
	make vmgenerate
	docker -H ssh://root@192.168.56.5 build --tag hello .

vmgenerate:
# generate linux binary
	cd generate_binary && docker -H ssh://root@192.168.56.5 build  -t slchris/alpine:3.12.0 .
	docker -H ssh://root@192.168.56.5 run -it --rm  --name generate_binary -v $(shell pwd):/build slchris/alpine:3.12.0 gcc -o /build/hello -static  /build/hello.c
generate:
# generate linux binary
	cd generate_binary/ && docker build -t slchris/alpine:3.12.0 .
	docker run -it --rm  --name generate_binary -v $(shell pwd):/build slchris/alpine:3.12.0 gcc -o /build/hello -static  /build/hello.c



clean:
	docker rmi hello
