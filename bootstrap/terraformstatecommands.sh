#!/bin/bash
#I created this resource group so I can store my terraform state
az group create -l eastus2 -n rg-terraformstate-prod-eus2-002
#This here is the storage account that will contain the blobs of terraform state and have local redundancy storage so if one rack goes down
#the storage account transfers to another rack and made sure that this wouldn't be public facing
az storage account create -n sttfstateeus2001aa -g rg-terraformstate-prod-eus2-002 -l eastus2 --sku standard_LRs --min-tls-version TLS1_2 --allow-blob-public-access false
#Here I created the container to store the blobs and I let azure CLI have an entra ID login so the person configuring the container only has
#a specific part of the container instead of having read and write on the whole thing, and if you wanted them gone, you would need to rotate 
#the key
az storage container create -n tfstate --account-name sttfstateeus2001aa --auth-mode login
#here I update the storage account so that it will include versioning so that whenever the state is updated the current file will be over written 
#but the previous version is kept
az storage account blob-service-properties update --enable-versioning true -n sttfstateeus2001aa -g rg-terraformstate-prod-eus2-002