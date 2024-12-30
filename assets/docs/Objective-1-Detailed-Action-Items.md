
| **Section**                           | **Requirement**                                            | **Task**                                                                                                        |                                                                                                         Subtasks/ References                                                                                                         | Doness |
| ------------------------------------- | ---------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----: |
| Detailed Task Plan                    | Project Planning                                           | Define clear Objectives for the Exercises                                                                       |                                                                                [platform Engineering Objectives](Platform-Engineering-Objectives.md)                                                                                 |  [X]   |
|                                       |                                                            | Create a detailed Task Execution Plan                                                                           |                                                                                             The current document itself provides details                                                                                             |  [X]   |
|                                       |                                                            | Create flow diagram for the planned tasks                                                                       |                                                                          [Gitops-ArgoCD-Crossplane-TaskFlow](../pics/Gitops-ArgoCD-Crossplane-TaskFlow.pdf)                                                                          |  [X]   |
|                                       |                                                            | Exercise Planning from Day-1 to Day-X                                                                           | Plan the Exercises<br>for new folks we onboard to project. This is to self-adopt themselves into k8s native application development,  Gitops features, Crossplane integration with Gitops, From basics of k8s Operators to expertise |  [ ]   |
|                                       |                                                            | Day-1                                                                                                           |                                                                                    [Day-1 Exercises](Day-1-Getting-Familiar-with-Development-Environment.md)                                                                                     |  [ ]   |
| **Development Environment Readiness** | Virtual Machine                                            | Virtual Machine Players                                                                                         |                                                                                                      VMware workstation Player                                                                                                       |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                               Pop! OS                                                                                                                |  [X]   |
|                                       | Supporting Softwares for k8s to install on Virtual Machine | OCI complaince runtimes                                                                                         |                                                                                                                Docker                                                                                                                |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                                Podman                                                                                                                |  [X]   |
|                                       |                                                            | Utility to monitor and switch the context of running k8s cluster                                                |                                                                                                            Podman Desktop                                                                                                            |  [X]   |
|                                       | IDE                                                        | IDE with capability to use container as a full-featured development environment                                 |                                                                                        Visual Studio code<br>with Dev Containers<br>extension                                                                                        |  [X]   |
|                                       | k8s                                                        | Experiment, local development, demonstrations                                                                   |                                                                                                               Minikube                                                                                                               |  [X]   |
|                                       |                                                            | Testing and development of Kubernetes itself, CI/CD pipelines for building and testing Kubernetes-related tools |                                                                                                                 Kind                                                                                                                 |  [X]   |
|                                       | Git Repository                                             | Git Repository for k8s native applications                                                                      |                                                                                          https://github.com/mak-xoriant/app-kis-k8s-gitops                                                                                           |  [X]   |
|                                       |                                                            | Git Repository for non-cloud gitops development                                                                 |                                                                                        https://github.com/mak-xoriant/pilot-gitops-non-cloud                                                                                         |  [X]   |
|                                       |                                                            | Git Repository for single source of truth gitops                                                                |                                                                                                                                                                                                                                      |  [ ]   |
|                                       |                                                            | Copy the Virtual Machine to Shared folder for usage                                                             |                                                                                                                                                                                                                                      |  [X]   |
| Adoption To Environment               | Getting familiarity about the  Environment                 | Minikube as environment to develop k8s native applications                                                      |                                                                                                   Setup Minikube to run on Docker                                                                                                    |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                 Manage multiple clusters by profile                                                                                                  |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                Enable Dashboard<br>to Monitor cluster                                                                                                |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                  Delete the cluster<br>and recreate                                                                                                  |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                             Switch k8s contexts<br>to different configs                                                                                              |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                         Deploy a sample application on the provisioned cluster with any particular namespace                                                                         |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                           Expose the deployed app as service on node port                                                                                            |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                      Enable Ingress controller                                                                                                       |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                   Configure the ingress to expose the application to outside world                                                                                   |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                               Monitor the health of deployed workloads                                                                                               |  [X]   |
|                                       |                                                            | Kind as environment to experiment ArgoCD and Crossplane                                                         |                                                                                                     Setup Kind to run on Docker                                                                                                      |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                 Manage multiple clusters by profile                                                                                                  |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                Enable Dashboard<br>to Monitor cluster                                                                                                |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                  Delete the cluster<br>and recreate                                                                                                  |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                             Switch k8s contexts<br>to different configs                                                                                              |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                         Deploy a sample application on the provisioned cluster with any particular namespace                                                                         |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                           Expose the deployed app as service on node port                                                                                            |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                    Enable Ingress controller and configure the ingress to expose the application to outside world                                                                    |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                               Monitor the health of deployed workloads                                                                                               |  [X]   |
| Continous Delivery                    | Argo CD                                                    | Setting Up Argo CD                                                                                              |                                                                                                             Non-HA Setup                                                                                                             |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                           Configure Access                                                                                                           |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                         Access ArgoCD Server                                                                                                         |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                 Port Forward and Access using web UI                                                                                                 |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                          Install ArgoCD CLI                                                                                                          |  [X]   |
|                                       |                                                            | Create and Configure applications for CD                                                                        |                                                                                             Define applications for continuous Delivery                                                                                              |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                            Create Application <br>1. Declaratively, <br>2. Using Web UI, <br>3. Using CLI                                                                            |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                Explore options available<br>with Helm                                                                                                |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                           Manage applications effectively using Kustomize                                                                                            |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                            Configure multiple sources<br>of Applications                                                                                             |  [X]   |
|                                       |                                                            | Manage Applications                                                                                             |                                                                                         Utilize Projects feature to manage multiple projects                                                                                         |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                           Control the Applications within projects by role                                                                                           |  [X]   |
|                                       |                                                            | Register Repositories                                                                                           |                                                                                                                public                                                                                                                |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                              private:<br>1. using https<br>2. using SSH                                                                                              |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                         Credential Templates                                                                                                         |  [X]   |
|                                       |                                                            | Manage Sync Options and control by policies                                                                     |                                                                                                            Automated sync                                                                                                            |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                                                    Automated Pruning/Self-healing                                                                                                    |  [X]   |
|                                       |                                                            |                                                                                                                 |                                                                         Other Options for Sync:<br>1. Selective<br>2. No Prune<br>3. Fail on Shared Resource                                                                         |  [X]   |
|                                       | Advanced Argo CD                                           | Tracking Strategies                                                                                             |                                                                                                         Tracking by Git Tag                                                                                                          |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                      Tracking by Git Commit SHA                                                                                                      |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                           Tracking by HEAD                                                                                                           |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                       Tracking Helm Chart Range of versions:<br>Latest Version                                                                                       |  [ ]   |
|                                       |                                                            | Diffing Customization                                                                                           |                                                                                                       How to customize diffing                                                                                                       |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                            Istio use case                                                                                                            |  [ ]   |
|                                       |                                                            | Sync Phases and waves                                                                                           |                                                                                                             Phase Hooks                                                                                                              |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                              Sync Waves                                                                                                              |  [ ]   |
|                                       |                                                            | Manage K8s Clusters                                                                                             |                                                                                                           Default feature                                                                                                            |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                  Explore how to adopt<br>Crossplane                                                                                                  |  [ ]   |
|                                       |                                                            | Application Set                                                                                                 |                                                                                                  Essential Usage of Application set                                                                                                  |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                              Generators                                                                                                              |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                           List Generators                                                                                                            |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                          Cluster Generators                                                                                                          |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                       Git Directory Generators                                                                                                       |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                          Matrix Generators                                                                                                           |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                       Pull Request Generators                                                                                                        |  [ ]   |
|                                       |                                                            | Automation by CI Pipelines                                                                                      |                                                                                                 CI and its flow integration with CD                                                                                                  |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                          Basic CI pipeline                                                                                                           |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                           Explore Git's Actions<br>And Configure basic Ci                                                                                            |  [ ]   |
|                                       |                                                            | How to Structure Git Repos                                                                                      |                                                                                                             App of Apps                                                                                                              |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                          Directory Approach                                                                                                          |  [ ]   |
|                                       |                                                            |                                                                                                                 |                                                                                                         Helm Chart Approach                                                                                                          |  [ ]   |