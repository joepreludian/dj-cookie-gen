#!/usr/bin/env bash
set -e

echo "Running post-gen-tasks"

echo "-> Building Base App Image"
make build_base_app_image

echo "-> Building Poetry Tool Image"
make build_poetry_tool_image

echo "-> Install latest version of packages via poetry"
make poetry_update_dependencies

echo "-> Building app Image"
make build_app_image

echo "-> Initiating app"
make setup_django_application

echo "-> Customizing Your newly created Django"
mv app/_dj_setups/settings.py app/core/settings.py
mv app/_dj_setups/celery.py app/core/celery.py
mv app/_dj_setups/core__init__.py app/core/__init__.py
mv app/_dj_setups/urls.py app/core/urls.py

rmdir app/_dj_setups
echo "SECRET_KEY=`openssl rand -base64 48`" >> .env.dev

echo "-> Consolidating settings"
make run_black

echo "-> Init git repo"
git init

echo "Please Run this command to start your project"
echo "  -> make django_first_run"

echo "-> Done! Enjoy!"
