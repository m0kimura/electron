lib = ../libraries

dockerfile: $(lib)/*.m4
	m4 -I $(lib) ./Dockerfile.m4 > Dockerfile

build: dockerfile
	docker build --rm -t your/image .

