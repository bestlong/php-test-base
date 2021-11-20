build:
	docker build -f ./php/Dockerfile --build-arg _PHP_VERSION=7.4 -t bestlong/php-test-base:7.4 .
	docker build -f ./php/Dockerfile --build-arg _PHP_VERSION=7.2 -t bestlong/php-test-base:7.2 .
	docker build -f ./php/Dockerfile --build-arg _PHP_VERSION=5.6 -t bestlong/php-test-base:5.6 .

build-fpm:
	docker build -f ./php/fpm/Dockerfile --build-arg _PHP_VERSION=7.4 -t bestlong/php-test-base:7.4-fpm .
	docker build -f ./php/fpm/Dockerfile --build-arg _PHP_VERSION=7.2 -t bestlong/php-test-base:7.2-fpm .
	docker build -f ./php/fpm/Dockerfile --build-arg _PHP_VERSION=5.6 -t bestlong/php-test-base:5.6-fpm .

build-all: build build-fpm

push:
	docker push bestlong/php-test-base:7.4
	docker push bestlong/php-test-base:7.2
	docker push bestlong/php-test-base:5.6

push-fpm:
	docker push bestlong/php-test-base:7.4-fpm
	docker push bestlong/php-test-base:7.2-fpm
	docker push bestlong/php-test-base:5.6-fpm

push-all: push push-fpm

dev:
	docker build -f ./php/Dockerfile --build-arg _PHP_VERSION=7.4 -t bestlong/php-test-base:7.4 .
