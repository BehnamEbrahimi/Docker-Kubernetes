docker build -t behnamebrahimi/docker-complex-client:latest -t behnamebrahimi/docker-complex-client:$GIT_SHA -f ./client/Dockerfile.dev ./client
docker build -t behnamebrahimi/docker-complex-server:latest -t behnamebrahimi/docker-complex-server:$GIT_SHA -f ./server/Dockerfile.dev ./server
docker build -t behnamebrahimi/docker-complex-worker:latest -t behnamebrahimi/docker-complex-worker:$GIT_SHA -f ./worker/Dockerfile.dev ./worker

docker push behnamebrahimi/docker-complex-client:latest
docker push behnamebrahimi/docker-complex-server:latest
docker push behnamebrahimi/docker-complex-worker:latest

docker push behnamebrahimi/docker-complex-client:$GIT_SHA
docker push behnamebrahimi/docker-complex-server:$GIT_SHA
docker push behnamebrahimi/docker-complex-worker:$GIT_SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=behnamebrahimi/docker-complex-server:$GIT_SHA
kubectl set image deployments/client-deployment client=behnamebrahimi/docker-complex-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=behnamebrahimi/docker-complex-worker:$GIT_SHA