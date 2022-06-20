FROM docker.io/joepreludian/python-poetry:3.10-alpine3.15

RUN set -ex && apk update && apk add --no-cache --virtual .build-deps build-base gcc cmake linux-headers libcurl \
    gcc rust cargo curl-dev && apk add postgresql-dev libmemcached-dev gdal gdal-dev geos zlib minizip expat uriparser \
    musl-dev zlib-dev jpeg-dev geos-dev libxslt-dev libxml2-dev boost libffi-dev libressl-dev gettext git curl  \
    proj proj-util proj-dev postgresql-client

