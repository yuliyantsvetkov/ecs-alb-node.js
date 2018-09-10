##############################
# Push the Docker image to AWS
##############################

module "docker-image-push" {

  source = "../modules/builds"

  command = <<EOT
    docker push ${var.account_URL}
  EOT

}