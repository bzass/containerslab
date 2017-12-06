# Create Resource Group
az group create --name aksK8sCluster --location westeurope

# Create Service Principal
az ad sp create-for-rbac --name aksK8sCluster --role Contributor --scopes /subscriptions/<SubscriptionID>/resourceGroups/aksK8sCluster

# Create K8s Cluster
# generate ssh keys
#az aks create --resource-group aksK8sCluster --name aksK8sCluster --location westeurope --kubernetes-version 1.8.2 --agent-vm-size Standard_DS2_v2 --agent-count 2 --service-principal <SERVICE_PRINCIPAL> --client-secret <CLIENT_SECRET> --generate-ssh-keys
# use existing ssh keys - for Windows use --ssh-key-value %userprofile%/.ssh/id_rsa.pub
az aks create --resource-group aksK8sCluster --name aksK8sCluster --location westeurope --kubernetes-version 1.8.2 --agent-vm-size Standard_DS2_v2 --agent-count 2 --service-principal <SERVICE_PRINCIPAL> --client-secret <CLIENT_SECRET> --ssh-key-value ~/.ssh/id_rsa.pub

# [Must for first time only] Install Kubectl CLI. If you are using Windows than kubectl is in "Program Piles (x86)". Make sure it is in your PATH variable
az aks install-cli

# Connect kubectl to cluster
az aks get-credentials --resource-group=aksK8sCluster --name=aksK8sCluster

# Check K8s contexts
kubectl config get-contexts

# If you have multiple K8s contexts, switch to new cluster
kubectl config use-context aksK8sCluster
kubectl config use-context acsk8sclus-acsk8scluster-c0e601mgmt
# Verify K8s context
kubectl config current-context

# Proxy to the dashboard
az aks browse --resource-group=aksK8sCluster --name=aksK8sCluster

# Open a browser and go to the following link
http://127.0.0.1:8001/ui/