#!/bin/bash
appServicePlanName="denys-functionreserver-plan"
resourceGroupName="$1"
location="$2"
acrName="$3"
tag="$4"
storageAccountName="$5"
secret="$6"
functionAppName="$7"

az appservice plan create -n $appServicePlanName -g $resourceGroupName --location $location --is-linux --sku B1

storageConnectionString=$(az storage account show-connection-string -g $resourceGroupName -n $storageAccountName -o tsv)

az functionapp create -n $functionAppName -g $resourceGroupName --storage-account $storageAccountName  -p $appServicePlanName --runtime java  --deployment-container-image-name $acrName.azurecr.io/petstorefunctions:$tag --docker-registry-server-password $secret --docker-registry-server-user $acrName

az functionapp config appsettings set --name $functionAppName --resource-group $resourceGroupName --settings "AZURE_STORAGE_CONNECTION_STRING=$storageConnectionString"