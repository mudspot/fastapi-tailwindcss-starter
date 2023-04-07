dependencies:
	@pip-compile requirements.in -o requirements.txt
	@pip-compile requirements-dev.in -o requirements-dev.txt
	@pip-sync requirements.txt requirements-dev.txt

lint: black-src isort-src flake-src

isort-src:
	isort ./app

black-src:
	black ./app

flake-src:
	flake8 ./app

lint-test: black-test isort-test flake-test

isort-test:
	isort ./app/tests

black-test:
	black ./app/tests

flake-test:
	flake8 ./app/tests

stop:
	docker-compose down --remove-orphans

start: stop
	docker-compose up --build

daemon: stop
	docker-compose up --build -d

dev: stop
	STAGE=dev docker-compose up --build

devtest:
	docker-compose exec fastapi-tailwindcss pytest -s -v app/tests/${TEST_FILE}

migrate:
	docker-compose exec fastapi-tailwindcss alembic --config app/alembic.ini upgrade head

rollback:
	docker-compose exec fastapi-tailwindcss alembic --config app/alembic.ini downgrade -1

rollback-all:
	docker-compose exec fastapi-tailwindcss alembic --config app/alembic.ini downgrade base

devstyles:
	cd tailwindcss && yarn tailwindcss -i ../app/styles/app.css -o ../app/assets/css/app.min.css --watch

styles:
	cd tailwindcss && yarn tailwindcss -i ../app/styles/app.css -o ../app/assets/css/app.min.css --minify