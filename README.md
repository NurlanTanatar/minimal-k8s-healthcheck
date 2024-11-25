`docker build -t healthcheck:test`
`minikube image load healthcheck:test`
`kubectl apply -f deploy.yaml`
`minikube tunnel`