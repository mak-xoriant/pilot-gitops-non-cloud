.ONESHELL: # Applies to every targets in the file!
# Test ***Hello starts***
.PHONY: list

# Path to the .env file
ENV_FILE = ../.env
PWD = $(shell pwd)
PROJECT_HOME = $(PWD)


# Export environment variables from the .env file
ifneq (,$(wildcard $(ENV_FILE)))
    include $(ENV_FILE)
    export
endif

hello-microk8s-gitops-dev:
	@printf "%s\n" "hello microk8s ops, you are operating argocd on microk8s cluster from below directory:";
	@printf "%s\n" $(PROJECT_HOME);

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

get-microk8s-status:
	microk8s status

enable-metrics-server:
	microk8s enable metrics-server

disable-metrics-server:
	microk8s disable metrics-server