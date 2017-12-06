# Create Resource Group
az group create --name prvContainerRegistry --location westeurope

# Create Azure Container Registry
az acr create --name <initialsYYYYMMDD> --resource-group prvContainerRegistry --sku Standard --location westeurope --admin-enabled false
					 
# Create Service Principal
az ad sp create-for-rbac --name <initialsYYYYMMDD> --role Owner --scopes /subscriptions/<SubscriptionID>/resourceGroups/prvContainerRegistry/providers/Microsoft.ContainerRegistry/registries/<initialsYYYYMMDD>

# Login to registry on your local machine to validate credentails
az acr login --name <initialsYYYYMMDD> --username <ClientId> --password <ClientSecret>
#docker login <initialsYYYYMMDD>.azurecr.io --username <ClientId> --password <ClientSecret>

# Push containers for test
docker pull wordpress:4.8-apache
docker tag wordpress:4.8-apache <initialsYYYYMMDD>.azurecr.io/wordpress:4.8-apache
docker push <initialsYYYYMMDD>.azurecr.io/wordpress:4.8-apache
docker pull mysql:5.6
docker tag mysql:5.6 <initialsYYYYMMDD>.azurecr.io/mysql:5.6
docker push <initialsYYYYMMDD>.azurecr.io/mysql:5.6

# Register Azure Container Registry in Kubernetes cluster
kubectl create secret docker-registry acrsecret --docker-server=<initialsYYYYMMDD>.azurecr.io --docker-username=<ClientId> --docker-password=<ClientSecret> --docker-email=<your@email.com>

# Add secret for MySQL
kubectl create secret generic mysql-pass-test --from-literal=password=Str0ngP@ssw0rd

# Deploy MySQL
kubectl create -f mysql.yaml

# Deploy WordPress
kubectl create -f wordpress.yaml

# Monitor progress
kubectl get service wordpress-test --watch

# Open a browser and go to the following link
http://<EXTERNAL-IP>