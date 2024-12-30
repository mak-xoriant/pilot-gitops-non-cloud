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

hello-argocd-gitops-dev:
	@printf "%s\n" "hello argocd ops, you are operating argocd on kind cluster from below directory:";
	@printf "%s\n" $(PROJECT_HOME);

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

# Argo CD ops starts here from here:
create-argocd-namespace:
	$(K8S-CONTROLLER) create namespace $(ARGOCD_NAMESPACE)

delete-argocd-namespace:
	$(K8S-CONTROLLER) delete namespace $(ARGOCD_NAMESPACE)

install-argocd-with-cluster-admin-privilages:
	$(K8S-CONTROLLER) apply -n $(ARGOCD_NAMESPACE) -f $(ARGOCD_INSTALLER_URL_ADMIN_PRIVILAGES)

list-clusters-added-to-argocd:
	argocd cluster list

offer-argocd-service-to-consumers:
	$(K8S-CONTROLLER) port-forward -n $(ARGOCD_NAMESPACE) svc/argocd-server $(ARGOCD_FORWARD_TO_LOCAL_PORT):443

get-argocd-initial-admin-password:
	$(K8S-CONTROLLER) get secret argocd-initial-admin-secret -n $(ARGOCD_NAMESPACE) -o jsonpath="{.data.password}" | base64 -d && \
	echo "\n"

login-to-argocd-server:
	argocd login localhost:$(ARGOCD_FORWARD_TO_LOCAL_PORT) --insecure
	
get-argocd-version:
	argocd version

#cli-create-app-on-argocd:
#argocd app create $(ARGOCD_CLI_APPLICATION)  --repo https://github.com/mak-xoriant/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace $(ARGOCD_CLI_APPLICATION)

cli-create-app-on-argocd:
	argocd app create $(ARGOCD_CLI_APPLICATION) \
  		--repo https://github.com/mak-xoriant/argocd-example-apps.git \
  		--path guestbook \
  		--dest-server https://kubernetes.default.svc \
  		--dest-namespace $(ARGOCD_CLI_APPLICATION) \
  		--sync-option CreateNamespace=true

declarative-create-app-on-argocd:
	$(K8S-CONTROLLER) apply -f guest-book-declarative-application.yaml

helm-create-app-on-argocd:
	$(K8S-CONTROLLER) apply -f guest-book-helm-application.yaml

deploy-directory-app-on-argocd:
	$(K8S-CONTROLLER) apply -f guest-book-deploy-dir-application.yaml

kustomize-create-app-on-argocd:
	$(K8S-CONTROLLER) apply -f guest-book-kustomize-application.yaml

list-applications-created-on-argocd:
	$(K8S-CONTROLLER) get application -n $(ARGOCD_NAMESPACE) && \
	argocd app list

delete-all-apps-from-argocd: declarative-delete-app-from-argocd cli-delete-app-from-argocd helm-delete-app-from-argocd directory-delete-app-from-argocd kustomize-delete-app-from-argocd

directory-delete-app-from-argocd:
	argocd app delete $(ARGOCD_DEPLOY_DIR_APPLICATION) --cascade

declarative-delete-app-from-argocd:
	argocd app delete $(ARGOCD_DECLARATIVE_APPLICATION) --cascade

cli-delete-app-from-argocd:
	argocd app delete $(ARGOCD_CLI_APPLICATION) --cascade

helm-delete-app-from-argocd:
	argocd app delete $(ARGOCD_HELM_APPLICATION) --cascade

kustomize-delete-app-from-argocd:
	argocd app delete $(ARGOCD_KUSTOMIZE_APPLICATION) --cascade	

check-current-rbac-config:
	kubectl get rolebinding,clusterrolebinding -n ifs-argocd | grep argocd-application-controller
# Argo CD ops starts here from here and ends here

# do this one-by-one
argocd-cli-installation:
	VERSION=$(curl -L -s https://raw.githubusercontent.com/argoproj/argo-cd/stable/VERSION) && \
	curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/download/v$VERSION/argocd-linux-amd64 && \
	sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd && \
	echo 'PATH=$(PATH):/usr/local/bin' >> ~/.bashrc
	rm argocd-linux-amd64



