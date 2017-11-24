## Summary

A Dockerfile for simple Symfony app container

- Based on ubuntu:16.04 for developer simplicity (not size)
- With nginx + php-fpm
- With rabbit-mq via php-enqueue/ampq
- Custom nginx, php and supervisord configurations
- Without a database

## Usage

### Variables

- $WWW_UID and $WWW_GID : Optional to change the UID/GID that nginx runs under to
solve permission issues if you are mounting a directory from your host

### Running

Pull from docker hub and run:

```
docker pull opendatastack/elasticsearch-import-api
docker run \
-e "APP_ELASTIC_SERVER_HOST=http://anotherurl:9400" \
-p 85:80 \
--name elasticsearch-import-api opendatastack/elasticsearch-import-api;
```

## Development & Test Cycle

Download: ```git clone git@github.com:OpenDataStack/docker-elasticsearch-import-api.git && cd docker-elasticsearch-import-api```

Change:

```
docker pull opendatastack/docker-symfony

```

```
docker rm elasticsearch-import-api;
docker build -t elasticsearch-import-api .;
docker run \
-e "APP_ELASTIC_SERVER_HOST=http://anotherurl:9400" \
-p 85:80 \
--name elasticsearch-import-api elasticsearch-import-api:latest;
```

Commit and push:

```
docker login
docker tag elasticsearch-import-api opendatastack/elasticsearch-import-api
docker push opendatastack/elasticsearch-import-api
```

### Debugging

Login:

```
docker exec -it elasticsearch-import-api /bin/bash
```

Copy files from the container:

```
docker cp elasticsearch-import-api:/etc/php/7.0/fpm/php.ini /PATH/TO/FILE
```
