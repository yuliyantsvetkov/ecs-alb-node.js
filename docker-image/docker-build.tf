########################################
# Build the docker image from Dockerfile
########################################

module "docker-image-build" {

  source = "../modules/builds"

  command = <<EOT
    docker build -t code/codechallenge .
    docker tag code/codechallenge:latest 613392456986.dkr.ecr.eu-west-1.amazonaws.com/code/codechallenge:latest
  EOT

}