all:
	make build

build:
	docker build -t slchris/alpine:3.12.0 .

clean:
	docker rmi slchris/alpine:3.12.0


vmbuild:
	docker -H ssh://root@192.168.56.5 build -t slchris/alpine:3.12.0 .


vmclean:
	docker -H ssh://root@192.168.56.5 rmi slchris/alpine:3.12.0
