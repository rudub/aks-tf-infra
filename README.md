# Azure Terraform AKS Module

This terraform code directory contains module code for Azure Kubernetes cluster. The idea is to use the module and create different environment tfvrs files to create a new cluster rather rewriting the whole code block. 

aks-module folder contains following files. 
- `acr.tf` - creating azure container registry to store the docker images. ACR creation is conditional, dont want to create multiple acr and want to bind the role in any new cluster being created.
- `aks.tf`  - This file contains code to only create Kubernetes cluster with default node pool.
- `custom_nodepool.tf` - This terraform code will create another node pool with vm size mentioned in var.tf file, default value given is 2.
- `spot_nodepool.tf` - This is specially for spot type nodepool to use it in lower environment. 
- `backend.tf` - To store tfstate file in storage account container. 

env/
- `po-vars.tfvars` - This file contains the actual values that needs to be provided while creating the respective AKS cluster for any environment. 

How to create the infrastructure. 
1. Clone the repo.
2. go inside aks-module folder 
`cd aks-module`
3. Follow terraform workspace strucutre to keep different envrionment file in different workspace. For ex:
```sh
terraform workspace new poc-env
terraform workspace select poc-env
terraform init
terraform plan -var-file ../env/poc-vars.tfvars -out tfplan
terraform apply tfplan
```



