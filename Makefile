
build:
	docker build -t env-ninja:latest .

run:
	docker run -e myname='Johnny' -v $(CURDIR):/workdir env-ninja:latest tests/my_little_template.json.tpl
