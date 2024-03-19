#!/bin/bash

resourceGroupName="$1"
location="$2"
acrName="$3"

echo "Resource group creation has started: $resourceGroupName"
az group create --name $resourceGroupName --location "$location" -o none
echo "Resource group created: $resourceGroupName"

echo "Acr creation has started"
az acr create --name $acrName --resource-group $resourceGroupName --sku Basic --admin-enabled true -o none
echo "Acr created"