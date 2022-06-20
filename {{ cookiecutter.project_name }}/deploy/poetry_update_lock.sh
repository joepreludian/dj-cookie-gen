#!/bin/sh

poetry env use system
poetry install
poetry update
poetry lock
