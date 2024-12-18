.ONESHELL: # Applies to every targets in the file!
# Test ***Hello starts***
.PHONY: list

K8S-CONTROLLER = kubectl
PWD = $(shell pwd)
PROJECT_HOME = $(PWD)
KIND-K8S = kind
KIND-K8S-CLUSTER-NAME = mak-gitops-cluster-eins
KIND-K8S-CONTAINER-NAME= $(KIND-K8S-CLUSTER-NAME)-control-plane
KIND-K8S-CONFIG-CONTEXT=kind-$(KIND-K8S-CLUSTER-NAME)
SANITY_CHECK_NODE_NAMESPACE = sanity-check-hello-node
SANITY_CHECK_NODE_DEPLOYMENT_NAME = hello-kind-k8s

ifneq (,$(wildcard ./.env))
    include .env
	export
endif

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

config-git-to-cache-password:
	git config --global credential.helper "cache --timeout=36000"

hello-dev-kind:
	@printf "%s\n" "hello kind ops, you are operating kind from below directory:";
	@printf "%s\n" $(PROJECT_HOME);

create-service-account:
	$(K8S-CONTROLLER) apply -f service-account.yaml

kube-get-contexts:
	$(K8S-CONTROLLER) config get-contexts

kube-delete-all-resources:
	$(K8S-CONTROLLER) delete all --all -n kubernetes-dashboard && \
	$(K8S-CONTROLLER) delete namespaces kubernetes-dashboard

helm-add-dashboard-repo:
	helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard

helm-install-dashboard:
	helm install dashboard kubernetes-dashboard/kubernetes-dashboard -n kubernetes-dashboard --create-namespace

kube-get-services:
	$(K8S-CONTROLLER) get services -n kubernetes-dashboard

kube-dashboard-port-forward:
	$(K8S-CONTROLLER) -n kubernetes-dashboard port-forward svc/dashboard-kong-proxy 8443:443

kube-dashboard-create-service-account:
	$(K8S-CONTROLLER) apply -f service-account.yaml

kube-dashboard-create-token:
	$(K8S-CONTROLLER) create token admin-user -n kubernetes-dashboard

kube-dashboard-describe-serviceaccount:
	$(K8S-CONTROLLER) describe serviceaccount admin-user -n kubernetes-dashboard

kube-dashboard-get-serviceaccount-secret:
	$(K8S-CONTROLLER) describe secret admin-user -n kubernetes-dashboard

# stand-alone
# recipe:1-a
stop-kind-cluster:
	@printf "%s\n" "stoping kind..." && \
	docker ps -q --filter name=$(KIND-K8S-CONTAINER-NAME) && \
	docker stop $$(docker ps -q --filter name=$(KIND-K8S-CONTAINER-NAME))

start-kind-cluster:
	@printf "%s\n" "starting kind..." && \
	docker ps -q --filter name=$(KIND-K8S-CONTAINER-NAME) && \
	docker start $$(docker ps -aq --filter name=$(KIND-K8S-CONTAINER-NAME))

get-kind-cluster-running-status:
	$(K8S-CONTROLLER) config use-context $(KIND-K8S-CONFIG-CONTEXT) && \
	$(K8S-CONTROLLER) get nodes

#recipe:1-b
delete-kind-cluster:
	@printf "%s\n" "deleting kind's container..." && \
	$(KIND-K8S) delete cluster --name $(KIND-K8S-CLUSTER-NAME)


deploy-hello-node:
	@printf "%s\n" "starting minikube's sanity check by deploying hello-node..." && \
	$(K8S-CONTROLLER) create ns $(SANITY_CHECK_NODE_NAMESPACE)

# stand-alone
# recipe:6
report-minikube-sanity-check:	clearscr k8s-version-header-print k8s-version switch-namespace-context-to-hello-node sanity-check-node-deployment-status sanity-check-node-configuration-view sanity-check-node-events-view

#recipe:3-b-1
clearscr:
	clear

#recipe:3-b-2
k8s-version-header-print:
	@printf "%s\n"
	@printf "%s\n" "Kubernetes version running inside minikube cluster:"
	@printf "%s\n"

#stand-alone
#recipe:3-b-3
k8s-version:
	$(K8S-CONTROLLER) version --output=yaml

#stand-alone
#recipe:3-b-4
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