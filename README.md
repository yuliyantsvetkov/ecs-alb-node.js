# VPC-ECS-ALB-Docker cluster deployment

## Description

This repository contains some Terraform, Bash and Docker code for deploying simple app. based on node.js for code challenge.
The following how-to is for Ubuntu 16.04 and greater.
---
### Prerequisites:

- Ubuntu 16.04 or greater
https://www.ubuntu.com/download/desktop

- Terraform >= 0.11.8
https://www.terraform.io/downloads.html

- Docker >=  17.12.1-ce, build 7390fc6
https://docs.docker.com/install/linux/docker-ce/ubuntu/
---
### Project structure
Below you can find the project directory structure with description of the folders that contain the porject code.

```
├── deployment
├── docker-image
└── modules
    ├── builds
    ├── elastic-container-vpc
    └── elastic-service
        ├── policies
        └── tasks
```

* deployment/ - contains the Terraform module declarations for the AWS networking and the ECS.
* docker-image/ - contains the `Dockerfile` needed for building your Node.js Docker image.
* module/ - here the Terraform modules are placed. Those files are the re-usable Terraform modules which define the infrastructure components.
* modules/builds/ - local provisioning module used for executing local commands like `docker build` & `docker push`
* modules/elastic-container-vpc/ - all VPC AWS Terraform resources needed for the creation of fully working AWS Virtual Private Cloud
* modules/elastic-service/ - all ECS AWS Terraform resources needed for the creation of fully functional ECS cluster
* modules/elastic-service/policies - AWS IAM policies for the ECS cluster
* modules/elastic-service/tasks - the AWS ECS Task definitions
---
### How to create the infrastructure

1) Once you have installed the software mentioned in the *Prerequisites* you need to checkout your Node.js code in the `docker-image/` folder. Edit the Docker file to match the building procedure you have for your Node.js application. Keep in mind that you need to expose port 80 and ensure that your app is not running on localhost.

2) Enter your `AWS_ACCESS_KEY_ID`, `AWS_SECRET_KEY`, `ACCOUNT_URL` and your local machine SSH public key inside the `./deployment/credentials.sh` file. Those are needed by Terraform in order to be able to access your AWS account.

* The ACCOUNT_URL variable is the URL to your ECS repository which is used to push Docker images. For example `0000000000000.dkr.ecr.eu-west-1.amazonaws.com/code/codechallenge:latest`

3) Change the tags and the build repository path inside the `docker-image/docker-build.tf` in order to tag correctly the new image build.

4) Change the ECS task definition according to your needs. You can find it in `modules/elastic-services/tasks/web_task_definition.json`

5) Enter the main project folder by typing `cd ../` and run the deployment bash script `deploy_me.sh`. After couple of minutes you will have the working ECS cluster on the `output` address from Terraform. The `output` address variable is called: `code-challange-DNS-name`. You will see it in green text color and it will look like this `project_name-alb-312321312321.eu-west-1.elb.amazonaws.com`.


* You can change your AWS region by editing the `terraform.tfvars` file, but then you need to change the AWS availability zones inside the `deployment/infrastructure.tf` file within the `locals{}` definition.
 
* ***AWS needs some time to deploy your Docker image to the ECS cluster. Usually after couple of minutes your cluster is fully ready to serve traffic.***
---
### How to destroy the infrastructure

1) Enter the main folder of the project and run `bash destroy_me.sh`. After couple of minutes there will be nothing left on your AWS account.

#### *Never use this project for production code. This is demo code and it should be used only on a test AWS account !!!*