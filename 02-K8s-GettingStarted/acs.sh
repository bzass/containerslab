# Create Resource Group
az group create --name acsK8sCluster --location westeurope

# Create Service Principal
az ad sp create-for-rbac --name acsK8sCluster --role Contributor --scopes /subscriptions/<SubscriptionID>/resourceGroups/acsK8sCluster

# Create K8s Cluster
# generate ssh keys
az acs create --resource-group acsK8sCluster --name acsK8sCluster --location westeurope --master-vm-size Standard_DS1_v2 --master-count 1 --master-storage-profile ManagedDisks --agent-vm-size Standard_DS1_v2 --agent-count 1 --agent-storage-profile ManagedDisks --orchestrator-type Kubernetes --service-principal <SERVICE_PRINCIPAL> --client-secret <CLIENT_SECRET> --generate-ssh-keys
# use existing ssh keys - for Windows use --ssh-key-value %userprofile%/.ssh/id_rsa.pub
#az acs create --resource-group acsK8sCluster --name acsK8sCluster --location westeurope --master-vm-size Standard_DS1_v2 --master-count 1 --master-storage-profile ManagedDisks --agent-vm-size Standard_DS2_v2 --agent-count 2 --agent-storage-profile ManagedDisks --orchestrator-type Kubernetes --orchestrator-version 1.7.7 --service-principal <SERVICE_PRINCIPAL> --client-secret <CLIENT_SECRET> --ssh-key-value ~/.ssh/id_rsa.pub

#az acs create --orchestrator-type kubernetes --resource-group YOUR_RESOURCE_GROUP --name YOUR_CLUSTER_NAME --agent-count 1 --generate-ssh-keys --verbose  


# [Must for first time only] Install Kubectl CLI. If you are using Windows than kubectl is in "Program Piles (x86)". Make sure it is in your PATH variable
az acs kubernetes install-cli

# Connect kubectl to cluster
az acs kubernetes get-credentials --resource-group acsK8sCluster --name acsK8sCluster

# Check K8s contexts
kubectl config get-contexts

# If you have multiple K8s contexts, switch to new cluster
kubectl config use-context <CONTEXT_NAME>

# Verify K8s context
kubectl config current-context

# Proxy to the dashboard
kubectl proxy

# Open a browser and go to the following link
http://127.0.0.1:8001/ui/