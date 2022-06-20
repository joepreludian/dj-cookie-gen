FROM {{ cookiecutter.dj_project_name }}_base:latest

WORKDIR /app/

USER root

COPY . /app/

RUN mkdir /app/{{ cookiecutter.dj_project_name }} &&  \
    touch /app/{{ cookiecutter.dj_project_name }}/__init__.py

RUN pip install --upgrade pip
RUN pip install .
RUN pip list

RUN chown app:app -R /app

RUN apk del .build-deps
RUN rm -Rf /app/{{ cookiecutter.dj_project_name }}

HEALTHCHECK CMD curl --fail http://localhost:{{ cookiecutter.dj_container_port }}

USER app

EXPOSE {{ cookiecutter.dj_container_port }}
