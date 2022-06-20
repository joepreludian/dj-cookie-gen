FROM python:3.10-alpine3.16

WORKDIR /app/

RUN addgroup --gid '1001' 'app' && adduser -G 'app' --disabled-password --uid '1001' 'app'

RUN set -ex && apk update && apk add --no-cache --virtual .build-deps build-base gcc cmake linux-headers libcurl \
    gcc rust cargo curl-dev && apk add postgresql-dev libmemcached-dev gdal gdal-dev geos zlib minizip expat uriparser \
    musl-dev zlib-dev jpeg-dev geos-dev libxslt-dev libxml2-dev boost libffi-dev libressl-dev gettext git curl  \
    proj proj-util proj-dev postgresql-client

RUN chown app:app -R /app

HEALTHCHECK CMD curl --fail http://localhost:{{ cookiecutter.dj_container_port }}

USER app

EXPOSE {{ cookiecutter.dj_container_port }}
