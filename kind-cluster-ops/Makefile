.ONESHELL: # Applies to every targets in the file!
# Test ***Hello starts***
.PHONY: list

K8S-CONTROLLER = kubectl
SANITY_CHECK_NODE_NAMESPACE = sanity-check-hello-node
SANITY_CHECK_NODE_DEPLOYMENT_NAME = hello-mini-k8s

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

deploy-hello-node:
	@printf "%s\n" "starting kind's sanity check by deploying hello-node..." && \
	$(K8S-CONTROLLER) create ns $(SANITY_CHECK_NODE_NAMESPACE) && \
	$(K8S-CONTROLLER) create deployment $(SANITY_CHECK_NODE_DEPLOYMENT_NAME) --namespace=$(SANITY_CHECK_NODE_NAMESPACE) --image=gcr.io/google-samples/hello-app:1.0

expose-sanity-check-deployment:
	@printf "%s\n" "exposing kind's sanity check node deployment as service..." && \
	$(K8S-CONTROLLER) expose deployment $(SANITY_CHECK_NODE_DEPLOYMENT_NAME) --namespace=$(SANITY_CHECK_NODE_NAMESPACE) --type=NodePort --port=8080

install-ingress-controller-nginx:
	@printf "%s\n" "Installing the latest ingress controller..." && \
	$(K8S-CONTROLLER) apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.0/deploy/static/provider/cloud/deploy.yaml

install-ingress-to-access-hello-mini-k8s:
	@printf "%s\n" "Installing the ingress ...." && \
	$(K8S-CONTROLLER) apply -f $(PROJECT_HOME)/nextgendi-dev-frappe/hello-mini-k8s-ingress.yaml