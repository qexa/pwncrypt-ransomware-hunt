SHELL := /bin/bash

.PHONY: install dev lint test fmt docs docs-serve build

install:
	uv venv || true
	uv pip install -e ".[dev]"

dev: install

lint:
	ruff check src || true
	python -m compileall -q src

fmt:
	ruff format src

test:
	pytest -q

docs:
	mkdocs build

docs-serve:
	mkdocs serve -a 127.0.0.1:8000

build: docs
