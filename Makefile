IMAGE_NAME?=bkutassy/env-ninja

local:
	go build -o env-ninja .

linux:
	GOOS=linux go build -o env-ninja .

build:
	docker build -t $(IMAGE_NAME):latest .

run:
	docker run -e myname='Johnny' -v $(CURDIR):/workdir $(IMAGE_NAME):latest tests/my_little_template.json.tpl

push:
	docker push $(IMAGE_NAME):latest
