# get the hash
GIT_SHA = $(git rev-parse HEAD)

# build docker-image with the recent git commit hash
docker build -t vagdevik/static-website-k8s:$GIT_SHA .

# push the image onto DockerHub
docker push vagdevik/static-website-k8s:$GIT_SHA

# apply k8s yaml configs to form k8s resources
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/

# update the image in deployment resource
kubectl set image deployment.apps/static-web-deployment -n=sample days-app-container=vagdevik/static-website-k8s:$GIT_SHA
