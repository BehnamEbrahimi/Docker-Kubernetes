# Kubernetes Local Setup

```bash
docker build -t michael4reynolds/multi-client ./client
docker build -t michael4reynolds/multi-server ./server
docker build -t michael4reynolds/multi-worker ./worker

docker push michael4reynolds/multi-client
docker push michael4reynolds/multi-server
docker push michael4reynolds/multi-worker

kubectl get deployments
kubectl delete deployment client-deployment
kubectl get services
kubectl delete service client-node-service
```

Run each time yaml file(s) change

```bash
ls k8s
kubectl apply -f k8s
kubectl get pods
kubectl get pv
kubectl get pvc
kubectl get deployments
kubectl get services
kubectl logs <pod>-<name>
```

Get Storage Class info

```bash
kubectl get storageclass
kubectl describe storageclass
```

Create secret password

```bash
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
kubectl get secrets
```

Add ingress-nginx with Docker for Mac and GCE

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/cloud-generic.yaml

# Click past insecure message on localhost for now
curl localhost
```

Kubernetes Dashboard

```bash
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl proxy

# In another terminal tab
Open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy
```
