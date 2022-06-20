# {{ cookiecutter.project_name }}
{{ cookiecutter.project_description }}

## Build

    $ docker-compose build app
    $ docker-compose build

# First Setup

    $ docker-compose up -d
    $ docker-compose exec app python manage.py migrate
    $ docker-compose exec app python manage.py createsuperuser

# i18n

    $ docker-compose exec app python manage.py makemessages --locale pt_BR

