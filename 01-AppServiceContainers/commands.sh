# Create Resource Group
az group create --name voteapp --location westeurope

# Create the AppService plan
az appservice plan create --resource-group voteapp --name voteapp --is-linux --sku B1 --location westeurope

# Create the web app
az webapp create --resource-group voteapp --name <initialsYYYYMMDD> --plan voteapp --deployment-container-image-name xstof/azure-vote

# Create Redis Service
az redis create --resource-group voteapp --name <initialsYYYYMMDD> --location westeurope --sku Basic --vm-size C0 --enable-non-ssl-port

# Get Redis key
az redis list-keys --resource-group voteapp --name <initialsYYYYMMDD> --query "primaryKey"

# Set Env for Web App
az webapp config appsettings set --resource-group voteapp --name <initialsYYYYMMDD> --settings REDIS=<initialsYYYYMMDD>.redis.cache.windows.net REDIS_PWD=<RedisKey>

# Reload WebApp with new Env settings
az webapp restart --resource-group voteapp --name <initialsYYYYMMDD>

# Browse WebApp
az webapp browse --resource-group voteapp --name <initialsYYYYMMDD>