
build:
	docker build -t bkutassy/env-ninja:latest .

run:
	docker run -e myname='Johnny' -v $(CURDIR):/workdir bkutassy/env-ninja:latest tests/my_little_template.json.tpl

push:
	docker push bkutassy/env-ninja:latest
