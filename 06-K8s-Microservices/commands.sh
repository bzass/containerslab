# Build & Push containers
# OrderService
sudo docker build -t <initialsYYYYMMDD>.azurecr.io/stickerstore/orderservice:1.0.0 ./StickerStore/OrderService/
sudo sudo docker push <initialsYYYYMMDD>.azurecr.io/stickerstore/orderservice:1.0.0
# PrintingService
sudo docker build -t <initialsYYYYMMDD>.azurecr.io/stickerstore/printingservice:1.0.0 ./StickerStore/PrintingService/
sudo docker push <initialsYYYYMMDD>.azurecr.io/stickerstore/printingservice:1.0.0
# StatusService
sudo docker build -t <initialsYYYYMMDD>.azurecr.io/stickerstore/statusservice:1.0.0 ./StickerStore/StatusService/
sudo docker push <initialsYYYYMMDD>.azurecr.io/stickerstore/statusservice:1.0.0
# Webstore
sudo docker build -t <initialsYYYYMMDD>.azurecr.io/stickerstore/webstore:1.0.0 ./StickerStore/Webstore/
sudo docker push <initialsYYYYMMDD>.azurecr.io/stickerstore/webstore:1.0.0

# Create infra on Azure (update sb.parameters.json before)
az group create --name stickerStoreMicroservices --location westeurope
az storage account create --resource-group stickerStoreMicroservices --name <initialsYYYYMMDD> --location westeurope --sku Standard_LRS
az group deployment create --resource-group stickerStoreMicroservices --template-file sb.template.json --parameters sb.parameters.json

# Get Storage connection string
az storage account show-connection-string --resource-group stickerStoreMicroservices --query "connectionString" --name <initialsYYYYMMDD>

# Get ServiceBus connection string
https://portal.azure.com/#resource/subscriptions/<SubscriptionID>/resourceGroups/StickerStoreMicroservices/providers/Microsoft.ServiceBus/namespaces/<initialsYYYYMMDD>/saskey

# Create a secert (update secret.yaml before)
kubectl create -f secret.yaml

# Deploy services
kubectl create -f deploy.yaml

# Scale Printing Service to 10
kubectl scale --replicas 10 deployment printingservice-deployment

# Scale Printing Service to 1
kubectl scale --replicas 1 deployment printingservice-deployment

# Update printing service version
# cd into PrintingService folder
# change the version number in printer.cs line 69

# Build & Push container for PrintingService
docker build -t <initialsYYYYMMDD>.azurecr.io/stickerstore/printingservice:1.0.1 ./StickerStore/PrintingService/
docker push <initialsYYYYMMDD>.azurecr.io/stickerstore/printingservice:1.0.1

# Set new container image for PrintingService
kubectl set image deployment/printingservice-deployment printingservice=<initialsYYYYMMDD>.azurecr.io/stickerstore/printingservice:1.0.1

# Check rollout history for PrintingService
kubectl rollout history deployment/printingservice-deployment

# Back to 1st revision of PrintingService
kubectl rollout undo deployment/printingservice-deployment --to-revision=1