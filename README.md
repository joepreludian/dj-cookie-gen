# đĒ Django Cookiecutter Project

Welcome to another cookiecutter django project generator. This one focuses on an opinionated generator with a small footprint.
This project is quite new and probably will change.

## â ī¸ This is an Alpha project
Please use at your own risk. This project has a long road in order to be usable. Some points that I find useful are: 
* Create a test suite;
* Develop a CI/CD pipeline in order to test and validate the installation.

## âšī¸ About this cookiecutter project
This one generates a project with the following technologies:

| Package | Version | Details                               |
| --- | --- |---------------------------------------|
 | Python | 3.10 |                                       |
 | Django | 4+ |                                       |
 | Django Rest Framework | 3.13+ | For REST api support                  |
 | Django Jazzmin | 2.5+ | For Admin customization               | 
 | Django Environment | 0.9 | For environment variables support     |
 | Celery | 5.2 | With redis support                    |
 | Django Storages | 1.12+ | For Storage support                   |
 | Poetry | | Responsible for managing dependencies | 

Also this project has full support for `docker` containers. You just need to have docker and docker compose installed and some useful command line tools.

# đ Running this project
First, you need to have installed the following softwares:

* Docker
* Docker compose
* Cookiecutter
* GNU Make

In order to create the project, please run:

    $ cookiecutter https://github.com/joepreludian/dj-cookie-gen.git

or you can run using cookiecutter as a python packageL

    $ python -m cookiecutter https://github.com/joepreludian/dj-cookie-gen.git

After installing, please run the following command to init your project;

    $ make django_first_run
This one will perform the following actions:
* Set the containers up via `docker compose up -d`;
* Run the migrations;
* Create a superuser;
* Restart the containers and you will be able to start coding! â¨

After generating your brand new project you should see a basic structure as defined below:

```
.
âââ app
âÂ Â  âââ base
âÂ Â  âÂ Â  âââ admin.py
âÂ Â  âÂ Â  âââ apps.py
âÂ Â  âÂ Â  âââ __init__.py
âÂ Â  âÂ Â  âââ migrations
âÂ Â  âÂ Â  âÂ Â  âââ __init__.py
âÂ Â  âÂ Â  âââ models.py
âÂ Â  âÂ Â  âââ tests.py
âÂ Â  âÂ Â  âââ views.py
âÂ Â  âââ core
âÂ Â  âÂ Â  âââ asgi.py
âÂ Â  âÂ Â  âââ celery.py
âÂ Â  âÂ Â  âââ __init__.py
âÂ Â  âÂ Â  âââ settings.py
âÂ Â  âÂ Â  âââ urls.py
âÂ Â  âÂ Â  âââ wsgi.py
âÂ Â  âââ manage.py
âÂ Â  âââ poetry.lock
âÂ Â  âââ pyproject.toml
âââ deploy
âÂ Â  âââ appBase.Dockerfile
âÂ Â  âââ app.Dockerfile
âÂ Â  âââ poetry_setup.sh
âÂ Â  âââ poetry_shell.sh
âÂ Â  âââ poetryTool.Dockerfile
âÂ Â  âââ poetry_update_lock.sh
âââ docker-compose.yml
âââ Makefile
âââ README.md
```

In a nutshell, it creates a basic structure as defined below:

* app/base -> An application that aims to serve as an one stop shop for your base models as well as some overrides;
* app/core -> The base django application with the `django-environ` setup;
* deploy -> Contains the images responsible for handling the project as:
  * appBase -> An alpine based linux with postgis support (GDAL) and other stuff;
  * app -> Inherits from appBase; installs the packages via pip; the project itself is a poetry based one (please check app/pyproject.toml for reference)
  * poetryTool -> Installs the same dependencies from appBase, but adds support for poetry. Useful for manipulate poetry;

# đĻĻ Makefile utils
In order to speedup your development proccess I created an utilitary `Makefile` file that helps you to communicate with docker compose; 

| command                      | What it does                                                                                               |
|------------------------------|------------------------------------------------------------------------------------------------------------|
| make migrations              | Run all the django migrations                                                                              |
 | make migrate                 | Create the migrations                                                                                      |
 | make see_installed_packages  | Runs a pip list in order to check the installed packages                                                   |
 | make build_poetry_tool_image | Rebuilds the poetry image, used for maintaining the poetry file                                            |
| make build_base_app_image | Generates the base Alpine image with the dependencies needed for the python packages being able to install |
| make build_app_image | Rebuilds the app image. Expects base image for being built first, otherwise it will fail                   |
 | make poetry_update_dependencies | Upgrade all poetry packages and generates the poetry lock file |
 | make poetry_shell | Runs a container with poetry enabled. You can run tools like `poetry add` |
 | make run_black | Runs black python code formatter inside your python project, fixing all the code |
 | make django_first_run | Runs all the basic commands in order to start your development proccess |

# Âŋ Needing help?
I would be pretty pleased if you use the tool. If you have any further question, please create an issue on this project.
Also I have plans to record a video teaching how to use this generator.