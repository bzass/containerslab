# Initialize Helm
helm init

# Create a new empty chart called "myvoteapp"
helm create myvoteapp

# Installing a Helm chart
helm install --name myvoteapp ./myvoteapp

# List the installed releases - should list "myvoteapp"
helm ls

# List the pods that our release installed
kubectl get pods

# Make note of the public ip and try browsing it
kubectl get svc

# Delete the release
helm delete --purge myvoteapp