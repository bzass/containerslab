# Deploy storage
kubectl create -f storage.yaml
kubectl get pv

# Add secret for MySQL
kubectl create secret generic mysql-pass --from-literal=password=Str0ngP@ssw0rd
kubectl get secrets

# deploy MySQL
kubectl create -f mysql.yaml
kubectl get pods

# deploy WordPress
kubectl create -f wordpress.yaml
kubectl get services wordpress