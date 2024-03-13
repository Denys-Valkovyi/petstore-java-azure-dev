#!/bin/bash
containerAppEnvName="denys-container-app-environment"
resourceGroupName="$1"
location="$2"
acrName="$3"
tag="$4"
insightsKey="$5"

echo "Started to create: Container App Env"
az containerapp env create -n $containerAppEnvName -g $resourceGroupName --location $location --enable-workload-profiles false
echo "Finished to create: Container App Env"

for petservice in app orderservice productservice petservice; do
	petStoreAppName="denys-$petservice-$location"
	echo "Started to create: " $petStoreAppName
	
    az containerapp up -n $petStoreAppName -g $resourceGroupName --location $location  --image $acrName.azurecr.io/petstore$petservice:$tag --ingress external --target-port 8080 --environment $containerAppEnvName
	
	az containerapp update -n $petStoreAppName -g $resourceGroupName --cpu 0.25 --memory 0.5Gi --min-replicas 1 --max-replicas 2 --scale-rule-name denys-autoscaler --scale-rule-http-concurrency 10 --set-env-vars "PETSTORESERVICES_AI_INSTRUMENTATION_KEY=$insightsKey"
	
	az containerapp ingress update --allow-insecure true --name $petStoreAppName --resource-group $resourceGroupName --transport auto
	
	az containerapp ingress sticky-sessions set -n $petStoreAppName -g $resourceGroupName --affinity none
	
	echo "Finished to create: " $petStoreAppName
 done

echo "Getting URLs for services"
orderServiceURL=$(az containerapp show --resource-group $resourceGroupName --name denys-orderservice-$location --query properties.configuration.ingress.fqdn -o tsv)
httpsOrderServiceURL="https://$orderServiceURL" 

productServiceURL=$(az containerapp show --resource-group $resourceGroupName --name denys-productservice-$location --query properties.configuration.ingress.fqdn  -o tsv)
httpsProductServiceURL="https://$productServiceURL"

petServiceURL=$(az containerapp show --resource-group $resourceGroupName --name denys-petservice-$location --query properties.configuration.ingress.fqdn  -o tsv)
httpsPetServiceURL="https://$petServiceURL"

echo "Started to update environment variables"
az containerapp update -n "denys-app-$location" -g $resourceGroupName --set-env-vars "PETSTOREPETSERVICE_URL=$httpsPetServiceURL" "PETSTOREPRODUCTSERVICE_URL=$httpsProductServiceURL" "PETSTOREORDERSERVICE_URL=$httpsOrderServiceURL"
 




