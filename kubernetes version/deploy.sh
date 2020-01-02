docker image build -t jeffersonfaseler/multi-client -t jeffersonfaseler/multi-client:$MIN_SHA -f ./client/Dockerfile.dev ./client
docker image build -t jeffersonfaseler/multi-server -t jeffersonfaseler/multi-server:$MIN_SHA -f ./server/Dockerfile.dev ./server
docker image build -t jeffersonfaseler/multi-worker -t jeffersonfaseler/multi-worker:$MIN_SHA -f ./worker/Dockerfile.dev ./worker

docker push jeffersonfaseler/multi-client:latest
docker push jeffersonfaseler/multi-server:latest
docker push jeffersonfaseler/multi-worker:latest

docker push jeffersonfaseler/multi-client:$MIN_SHA
docker push jeffersonfaseler/multi-server:$MIN_SHA
docker push jeffersonfaseler/multi-worker:$MIN_SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=jeffersonfaseler/multi-server:$MIN_SHA
kubectl set image deployments/client-deployment client=jeffersonfaseler/multi-client:$MIN_SHA
kubectl set image deployments/worker-deployment worker=jeffersonfaseler/multi-worker:$MIN_SHA