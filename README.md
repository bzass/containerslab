# Containers Lab notes


Prerequisites:

* OS: Windows 10 / Linux / macOS; For Windows 7 users - create Azure VM with ubuntu and install docker there
* Docker on local OS https://www.docker.com/community-edition#/download
* Visual Studio Code https://code.visualstudio.com + extensions:
    * YAML https://marketplace.visualstudio.com/items?itemName=adamvoss.yaml
    * Docker https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker
    * Python https://marketplace.visualstudio.com/items?itemName=ms-python.python
    * C# https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp
    * Azure Resource Manager Tools https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools
    * Visual Studio Team Services https://marketplace.visualstudio.com/items?itemName=ms-vsts.team
    * Azure Account https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account
    * Azure CLI Tools https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli
    * NuGet Package Manager https://marketplace.visualstudio.com/items?itemName=jmrog.vscode-nuget-package-manager
* Azure CLI 2.0 (on Windows: https://aka.ms/InstallAzureCliWindows, OSX and Linux: https://azure.github.io/projects/clis/)
* Optional
    * .NET Core 2.0 https://www.microsoft.com/net/download
    * Azure Storage Explorer https://azure.microsoft.com/en-us/features/storage-explorer
* GitHub account https://github.com
* Docker Hub account https://hub.docker.com

# Lab scenario

**Attendees guide:
https://github.com/palma21/k8slab**

if you get stuck - its a really good idea to use this :)

https://github.com/palma21/k8slabproctor

to get kubernetes dashboard up and running use:  
kubectl proxy  
127.0.0.1:8001  
add the following to the end: /     

  
            
USE THIS WHEN YOU ARE USING AZURE FREE [update git]:    
az acs create --orchestrator-type kubernetes --resource-group workshopno --name myK8SCluster --agent-count 1 --generate-ssh-keys --verbose  
 


use this for if you cannot share your c drive:  
https://blogs.msdn.microsoft.com/stevelasker/2016/06/14/configuring-docker-for-windows-volumes/
 


Free version: remember to add following in the azure portal (in order to deploy containers services):
microsoft.compute  
microsoft.ContainerService  
Microsoft.Storage  
Microsoft.network  

Free account does NOT work in West UK!

 
Symantec AV protection can block kubectl get-credential command while running inside Linux sub system for Windows. Sudo apt-get update also fails. 

# Contact

Bartłomiej Zass, bzass@microsoft.com
