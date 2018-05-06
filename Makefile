.PHONY: test test_api test_ui test_selenium

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test -v -m "not uitest"

test_smoke:
	curl -I --fail 127.0.0.1:5000

run:
	python main.py

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

USERNAME=kasiek90
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
		@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
		docker tag hello-world-printer $(TAG); \
		docker push $(TAG); \
		docker logout;



test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml

test_api:
	python test_api/test_api.py

test_ui:
	pytest --verbose -s test_ui/test_ui.py

test_selenium:
	pytest test_selenium/test_selenium.py
