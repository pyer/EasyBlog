.PHONY: clean build deploy run

all: build

clean:
	@rm -rf www
	@find ./ -name "*~" -delete

build: clean
	ruby ./easy.rb

deploy: build
	cat .netrc macdef >${HOME}/.netrc
	ftp ftp.cluster121.hosting.ovh.net

run: build
	sudo cp -r www /srv/
	rackup --port 8080 --server puma

