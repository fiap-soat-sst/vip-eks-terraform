# SST Kubernetes and terraform

this repository contains all the infrastructure of the VIP API.

This project is part of the Hackathon of FIAP SOAT course. This repository supports our application created in Typescript. 

## How it works

These terraform files provide a Kubernetes solution to ensure the infrastructure that the application SST needs.
We provided an updated environment when a new pull request is merged, altering it in the cloud.

## How to use

### Download the repo:
``` bash
  git clone https://github.com/evilfeeh/vip-eks-terraform
```

### Fill the envs:
check out the env.auto.tfvars.sample and fill it with your environment variables

### Run init:
``` bash
  terraform init
```

### Validate:
Validate the file to ensure everything is correct with the resources
``` bash
  terraform validate 
```

### Plan the Changes
Generate and review an execution plan to preview the changes Terraform will apply:

``` bash
terraform plan
```

### Apply the Changes
Once the plan is reviewed, apply the changes to your cloud infrastructure:

``` bash
terraform apply
```

### Submit Changes via Pull Request
To update the infrastructure:

1. Make your changes.
2. Create a pull request.
3. Once the pull request is merged, the pipeline will automatically apply the changes and update the infrastructure.

create a new pull request with your applications;
When validated and merged, the pipeline will apply the changes automatically.

## Contact
Please, feel free to open issues or contact the developer's team. We'll be happy to help.
