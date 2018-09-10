###############################################
# Null resource for local execution of commands
###############################################
resource "null_resource" "deploy" {

 provisioner "local-exec" {
    command = "${var.command}"
  }

}