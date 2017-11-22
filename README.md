# Containers Lab notes

## Prerequisites:

* OS: Windows 10 / Linux / macOS; For Windows 7 users - create Azure VM with ubuntu and install docker there
* Docker on local OS https://www.docker.com/community-edition#/download
* Azure CLI 2.0 (on Windows: https://aka.ms/InstallAzureCliWindows, OSX and Linux: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest or https://azure.github.io/projects/clis/)
* Optional: Visual Studio Code https://code.visualstudio.com + extensions:
    * YAML https://marketplace.visualstudio.com/items?itemName=adamvoss.yaml
    * Docker https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker
    * Python https://marketplace.visualstudio.com/items?itemName=ms-python.python
    * C# https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp
    * Azure Resource Manager Tools https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools
    * Visual Studio Team Services https://marketplace.visualstudio.com/items?itemName=ms-vsts.team
    * Azure Account https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account
    * Azure CLI Tools https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli
    * NuGet Package Manager https://marketplace.visualstudio.com/items?itemName=jmrog.vscode-nuget-package-manager

## Note for Azure Trial subscriptions

To create ACS cluster on Azure Trial subscription, first register services:

```
az provider register -n Microsoft.Compute  
az provider register -n Microsoft.ContainerService  
az provider register -n Microsoft.Storage  
az provider register -n Microsoft.Network
```

Then remember to add `--agent-count 1` to az acs command:

```
az group create -n YOUR_RESOURCE_GROUP -l westeurope

az acs create --orchestrator-type kubernetes --resource-group YOUR_RESOURCE_GROUP --name YOUR_CLUSTER_NAME --agent-count 1 --generate-ssh-keys --verbose  
```


## Lab scenario

**Attendees guide:
https://github.com/palma21/k8slab**

if you get stuck - its a really good idea to use: https://github.com/palma21/k8slabproctor

Advanced Kubernetes lab:
https://github.com/tkubica12/kubernetes-demo

# Notes

To get kubernetes dashboard up and running use:  
```
kubectl proxy
```  
127.0.0.1:8001
add the following to the end: /     


Use this if you cannot share your c drive:  
https://blogs.msdn.microsoft.com/stevelasker/2016/06/14/configuring-docker-for-windows-volumes/
 
 
Symantec AV protection can block kubectl get-credential command while running inside Linux sub system for Windows. Sudo apt-get update also fails. 



# Contact

Bartłomiej Zass, linkedin.com/in/zassb/, bzass@microsoft.com
