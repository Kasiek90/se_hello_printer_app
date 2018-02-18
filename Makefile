deps:
	pip install 	-r requirements.txt; \
	pip install 	-r test_requirements.txt
lint:
	flake8 hello_world test
docker_build:
	docker_build -t hello-world-printer .
test:
	PYTHONPATH=. py.test
	PYTHONPATH=. py.test --vebrose -s
run:
	python py.test
