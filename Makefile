.ONESHELL: # Applies to every targets in the file!
# Test ***Hello starts***
.PHONY: list


ifneq (,$(wildcard ./.env))
    include .env
	export
endif

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

hello:
	echo "you are on pilot gitops non cloud"

config-git-to-cache-password:
	git config --global credential.helper "cache --timeout=36000"

