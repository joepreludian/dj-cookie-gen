translation:
	docker compose exec app python manage.py makemessages --locale pt_BR
compile_translation:
	docker compose exec app python manage.py compilemessages --locale pt_BR
migrations:
	docker compose exec app python manage.py makemigrations
migrate:
	docker compose exec app python manage.py migrate
see_installed_packages:
	docker compose exec app pip list
build_base_app_image:
	docker build -t {{ cookiecutter.dj_project_name }}_base:latest -f ./deploy/appBase.Dockerfile ./app/
build_poetry_tool_image:
	docker build -t {{ cookiecutter.dj_project_name }}_poetry:latest -f ./deploy/poetryTool.Dockerfile ./app/
build_app_image:
	docker compose build app
poetry_update_dependencies:
	docker compose run --rm poetry /deploy/poetry_update_lock.sh
setup_django_application:
	docker compose run --rm app django-admin startproject core .
	docker compose run --rm app python manage.py startapp base
django_first_run:
	docker compose up -d
	sleep 10
	docker compose exec app python manage.py migrate
	docker compose exec app python manage.py createsuperuser
	docker compose down
	docker compose up -d
poetry_shell:
	docker compose run --rm poetry
run_black:
	docker compose run --rm black