#!/bin/bash

resourceGroupName="$1"
location="$2"
acrName="$3"

echo "Resource group creation has started"
az group create --name $resourceGroupName --location "$location" -o none
echo "Resource group created"
echo "Acr creation has started"
az acr create --name $acrName --resource-group $resourceGroupName --sku Basic --admin-enabled true -o none
echo "Acr created"
sleep 20
echo "Password for ACR:"
az acr credential show --name $acrName --query 'passwords[0].value'