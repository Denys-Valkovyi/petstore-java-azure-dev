#!/bin/bash
resourceGroupName="$1"
location="$2"
acrName="$3"
tag="$4"
insightsKey="$5"
httpsFunctionUrl="$6"


for petservice in app orderservice productservice petservice; do
	appServicePlanName="denys-$petservice-plan-$location"
	echo "Started to create AppServicePlan: $appServicePlanName"
	
	az appservice plan create -n $appServicePlanName -g $resourceGroupName --location $location --is-linux --sku B1
	
	
	appServiceName="denys-$petservice-$location"
	echo "Started to create app service: $appServiceName" 
	az webapp create -n $appServiceName -g $resourceGroupName -p $appServicePlanName  -i $acrName.azurecr.io/petstore$petservice:v1
	
	az webapp config appsettings set -n $appServiceName -g $resourceGroupName --settings WEBSITES_PORT=8080
	
	echo "Finished to create: " $petStoreAppName
 done 
 
httpsOrderServiceURL="https://denys-orderservice-$location.azurewebsites.net" 

httpsProductServiceURL="https://denys-productservice-$location.azurewebsites.net"

httpsPetServiceURL="https://denys-petservice-$location.azurewebsites.net"
 
echo "Started to update environment variables"
az webapp config appsettings set -n "denys-app-$location" -g $resourceGroupName --settings "PETSTOREPETSERVICE_URL=$httpsPetServiceURL" "PETSTOREPRODUCTSERVICE_URL=$httpsProductServiceURL" "PETSTOREORDERSERVICE_URL=$httpsOrderServiceURL" "PETSTORERESERVERSERVICE_URL=$httpsFunctionUrl"

echo "Start URL: https://denys-app-$location.azurewebsites.net"