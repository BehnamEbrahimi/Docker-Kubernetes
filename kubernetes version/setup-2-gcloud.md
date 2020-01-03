# Steps to Create

## GCP Kubernetes App

### Create Github Repo - `using hub`

```bash
git init
git add .
git commit -m 'init'
git create -d 'Multi-Kubernetes app sample'
```

### Link to Travis

- open [Travis CI](https://travis-ci.org)
- Sync Account
- Search for Multi-K8s
- Profile > Repositories > Multi-K8s - click `+`
- refresh page

### Create Google Cloud Project

- Project > New Project --> Create

### Set up Billing for Project

### Kubernetes Engine init

### Create Cluster

- Name it whatever you want ie. multi-cluster

### Create a Service Account

- GCP Nav Menu > IAM & Admin > Service Accounts > Create Service Account
- Service account name: travis-deployer
- Role: Kubernetes > Kubernetes Engine Admin
- Furnish a new private key > JSON
- SAVE & NEVER EXPOSE SAVED FILE!!!

### Download & Install the Travis CLI

- We're using a Docker container simply to make sure that you can use Ruby without installing it onto your system in case you don't have it already - ie. Windows

```bash
docker run -it -v $(pwd):/app ruby:2.3 sh

ls
cd app
ls
gem install travis --no-rdoc --no-ri
travis
travis login

Copy and rename json key to current directory volume - ie. ~/Downloads to multi-k8s/service-account.json
```

```bash
ls
travis encrypt-file service-account.json -r michael4reynolds/multi-k8s
```

Copy given `openssl` command and paste it into .travis.yml's before-install section

Remove service-account.json

```bash
rm -f service-account.json
ls

exit
```

Get Project Id from GCP > Nav > settings : Project ID

Get Default Data Zone from GCP > Nav > Kubenetes Engine > Clusters : Location
Get Cluster Name from GCP > Nav > Kubenetes Engine > Clusters : Name

Add Docker username and password to environment variables on Travis CI > My Repos > multi-k8s > Settings > Environment variables

Use Git SHA

```bash
git rev-parse HEAD
git log
```

## Configure GCloud CLI on Cloud Console

GCP > Open Shell:

```bash
# In GCloud Shell
# Only needs to run once!
gcloud config set project multi-k8s-217015
gcloud config set compute/zone us-east1-b
gcloud container clusters get-credentials multi-cluster
kubectl get pods
kubectl create secret generic pgpassword --from-literal PGPASSWORD=mypgpassword123
```

Verify pgpasswod is added to GCP > Kubernetes Engine > Configuration

Install Helm

- [Instructions](https://docs.helm.sh/using_helm/#installing-helm)
- [Script](https://docs.helm.sh/using_helm/#from-script)

```bash
# In GCloud Shell
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller --upgrade
```

Ingress Nginx
[Deploy Ingress Nginx](https://kubernetes.github.io/ingress-nginx/deploy/)

```bash
# In GCloud Shell
helm install stable/nginx-ingress --name my-nginx --set rbac.create=true
```

Confirm ingress controller installation

- GCP > Nav > Kube Engine > Workloads
- GCP > Nav > Kube Engine > Services
- GCP > Nav > Network Services > Load Balancing

## Deploy

```bash
git add .
git commit -m 'latest commit message here'
git push origin master
```

Confirm deployments created on GCP

- GCP > Nav > Kube Engine > Workloads
- GCP > Nav > Kube Engine > Services
- GCP > Nav > Kube Engine > Configuration
- GCP > Nav > Kube Engine > Storage

## Workflow for Changing in Production

Terminal

```bash
git checkout -b devel
git status
git add .
git commit -m 'updated header'
git push origin devel
git checkout master
```

Github

- Pull requests
  - New pull request
    - compare(devel) merge into
    - base(master)
    - Create Pull Request
    - Edit title, message
    - Create pull request
    - Wait for green - all checks have passed
    - Click Merge pull request
    - Confirm merge
    - Delete branch - Or not
