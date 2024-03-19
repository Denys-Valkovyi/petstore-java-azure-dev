#!/bin/bash

resourceGroupName="$1"
location="$2"
storageAccountName="$3"

az storage account create -n $storageAccountName -g $resourceGroupName -l $location --sku Standard_LRS --access-tier Cool

storageConnectionString=$(az storage account show-connection-string -g $resourceGroupName -n $storageAccountName -o tsv)

sleep 10

#TODO: make container name an environment variable for function app
az storage container create -n reservationcontainer --connection-string $storageConnectionString --resource-group $resourceGroupName
