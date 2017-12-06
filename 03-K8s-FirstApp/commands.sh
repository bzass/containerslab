# Create the MyFirstApp deployment
kubectl create -f deployment.yaml

# Expose the deployment with a service
kubectl create -f service.yaml

# Describe the service and the deployment
kubectl describe deployment
kubectl describe service

# Monitor progress
kubectl get service azure-vote-front --watch

# Open a browser and go to the following link
http://<EXTERNAL-IP>