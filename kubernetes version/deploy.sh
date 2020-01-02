docker image build -t behnamebrahimi/docker-complex-client -t behnamebrahimi/docker-complex-client:$MIN_SHA -f ./client/Dockerfile.dev ./client
docker image build -t behnamebrahimi/docker-complex-server -t behnamebrahimi/docker-complex-server:$MIN_SHA -f ./server/Dockerfile.dev ./server
docker image build -t behnamebrahimi/docker-complex-worker -t behnamebrahimi/docker-complex-worker:$MIN_SHA -f ./worker/Dockerfile.dev ./worker

docker push behnamebrahimi/docker-complex-client:latest
docker push behnamebrahimi/docker-complex-server:latest
docker push behnamebrahimi/docker-complex-worker:latest

docker push behnamebrahimi/docker-complex-client:$MIN_SHA
docker push behnamebrahimi/docker-complex-server:$MIN_SHA
docker push behnamebrahimi/docker-complex-worker:$MIN_SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=behnamebrahimi/docker-complex-server:$MIN_SHA
kubectl set image deployments/client-deployment client=behnamebrahimi/docker-complex-client:$MIN_SHA
kubectl set image deployments/worker-deployment worker=behnamebrahimi/docker-complex-worker:$MIN_SHA