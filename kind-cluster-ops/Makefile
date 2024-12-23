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
    export $(shell sed 's/=.*//' $(ENV_FILE))
endif

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

config-git-to-cache-password:
	git config --global credential.helper "cache --timeout=36000"

hello-kind-gitops-dev:
	@printf "%s\n" "hello kind ops, you are operating kind from below directory:";
	@printf "%s\n" $(PROJECT_HOME);

kube-get-contexts:
	$(K8S-CONTROLLER) config get-contexts

kube-get-cluster-info:
	$(K8S-CONTROLLER) cluster-info --context $(KIND-K8S-CONFIG-CONTEXT)

create-kind-cluster:
	@printf "%s\n" "creating kind cluster..." && 
	$(KIND-K8S) create cluster --name=$(KIND-K8S-CLUSTER-NAME)

start-kind-cluster:
	@printf "%s\n" "starting kind..." && \
	docker ps -q --filter name=$(KIND-K8S-CONTAINER-NAME) && \
	docker start $$(docker ps -aq --filter name=$(KIND-K8S-CONTAINER-NAME))

# stand-alone
# recipe:1-a
stop-kind-cluster:
	@printf "%s\n" "stoping kind..." && \
	docker ps -q --filter name=$(KIND-K8S-CONTAINER-NAME) && \
	docker stop $$(docker ps -q --filter name=$(KIND-K8S-CONTAINER-NAME))

delete-kind-cluster:
	@printf "%s\n" "creating kind cluster..." && \
	$(KIND-K8S) delete cluster --name=$(KIND-K8S-CLUSTER-NAME)

get-kind-cluster-node-running-status:
	$(K8S-CONTROLLER) config use-context $(KIND-K8S-CONFIG-CONTEXT) && \
	$(K8S-CONTROLLER) get nodes

helm-add-dashboard-repo:
	helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard

helm-install-dashboard:
	helm install dashboard kubernetes-dashboard/kubernetes-dashboard -n kubernetes-dashboard --create-namespace

kube-dashboard-get-services:
	$(K8S-CONTROLLER) get services -n kubernetes-dashboard

kube-dashboard-create-service-account:
	$(K8S-CONTROLLER) apply -f service-account.yaml

kube-dashboard-create-token:
	$(K8S-CONTROLLER) create token admin-user -n kubernetes-dashboard

offer-dashboard-service-to-consumers:
	$(K8S-CONTROLLER) -n kubernetes-dashboard port-forward svc/dashboard-kong-proxy $(DASHBOARD_FORWARD_TO_LOCAL_PORT):443

kube-delete-dashboard-all-resources:
	$(K8S-CONTROLLER) delete all --all -n kubernetes-dashboard && \
	$(K8S-CONTROLLER) delete namespaces kubernetes-dashboard

deploy-hello-node:
	@printf "%s\n" "starting minikube's sanity check by deploying hello-node..." && \
	$(K8S-CONTROLLER) create ns $(SANITY_CHECK_NODE_NAMESPACE) && \
	$(K8S-CONTROLLER) create deployment $(SANITY_CHECK_NODE_DEPLOYMENT_NAME) --namespace=$(SANITY_CHECK_NODE_NAMESPACE) --image=gcr.io/google-samples/hello-app:1.0

expose-sanity-check-deployment:
	@printf "%s\n" "exposing minikube's sanity check node deployment as service..." && \
	$(K8S-CONTROLLER) expose deployment $(SANITY_CHECK_NODE_DEPLOYMENT_NAME) --namespace=$(SANITY_CHECK_NODE_NAMESPACE) --type=NodePort --port=8080

#$(MINI-K8S) service $(SANITY_CHECK_NODE_DEPLOYMENT_NAME) -n $(SANITY_CHECK_NODE_NAMESPACE)
offer-hello-node-service-to-consumers:
 	$(K8S-CONTROLLER)  port-forward service/hello-kind-k8s $(HELLO_NODE_FORWARD_TO_LOCAL_PORT):8080
# stand-alone
# recipe:6
report-kind-sanity-check:clearscr k8s-version-header-print k8s-controller-version switch-namespace-context-to-hello-node sanity-check-node-deployment-status sanity-check-node-configuration-view sanity-check-node-events-view

#recipe:3-b-1
clearscr:
	clear

#recipe:3-b-2
k8s-version-header-print:
	@printf "%s\n"
	@printf "%s\n" "Kubernetes version running inside kind cluster:"
	@printf "%s\n"

#stand-alone
#recipe:3-b-3
k8s-controller-version:
	$(K8S-CONTROLLER) version --output=yaml

#stand-alone
#recipe:3-b-4
#danegeous don't use this
switch-namespace-context-to-hello-node:
	@printf "%s\n" "Switching to sanity check namespace..." && \
	$(K8S-CONTROLLER) config set-context --current --namespace='$(SANITY_CHECK_NODE_NAMESPACE)'

#stand-alone
#recipe:3-a-5
sanity-check-node-deployment-status:
	@printf "%s\n"
	@printf "%s\n" "hello-node deployment running status:"
	@printf "%s\n"
	$(K8S-CONTROLLER) get all

#recipe:3-a-6
sanity-check-node-configuration-view:
	@printf "%s\n"
	@printf "%s\n" "hello-node configuration view:"
	@printf "%s\n"
	$(K8S-CONTROLLER) config view

#recipe:3-a-7
sanity-check-node-events-view:
	@printf "%s\n"
	@printf "%s\n" "hello-node events happened till NOW:"
	@printf "%s\n"
	$(K8S-CONTROLLER) get events

# we may need the below in future

kube-dashboard-describe-serviceaccount:
	$(K8S-CONTROLLER) describe serviceaccount admin-user -n kubernetes-dashboard

# username: admin
# pass: echo 'secret-grabbed-from-yaml' | base64 --decode 