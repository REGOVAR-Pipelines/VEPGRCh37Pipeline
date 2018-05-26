# Change paths for inputs, outputs, databases and logs in the host and in the container.

IMAGE_NAME = my_example_pipeline
PACKAGE_NAME = $(shell sed -n 's/.*"name"\s*:\s*"\([^"]*\)".*/\1/p')_v$(shell sed -n 's/.*"version"\s*:\s*"\([^"]*\)".*/\1/p').zip

package: $(PACKAGE_NAME)

$(PACKAGE_NAME): doc Dockerfile form.json LICENSE manifest.json README
	zip -r $@ $^ 

build:
	docker build -t $(IMAGE_NAME) .

test: build
	mkdir /tmp/{inputs,outputs,databases,logs}
	docker run -a stdin -a stdout -it -v /tmp/inputs:/regovar/inputs:ro -v /tmp/outputs:/regovar/outputs -v /tmp/databases:/regovar/databases:ro -v /tmp/logs:/regovar/logs --network regovar_net --name regovar_test --user $$(id -u):$$(id -g) $(IMAGE_NAME)

.PHONY: build package test