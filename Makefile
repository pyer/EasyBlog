.PHONY: clean build install deploy run

all: build

clean:
	@rm -rf www
	@find ./ -name "*~" -delete

build: clean
	ruby ./easy.rb

install: build
	sudo cp -r www /srv/

deploy: build
	cat .netrc macdef >${HOME}/.netrc
	ftp ftp.cluster121.hosting.ovh.net

run:
	rackup --port 8080 --server puma

