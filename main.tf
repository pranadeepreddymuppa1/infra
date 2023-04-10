resource "null_resource" "keyvaule" {
  provisioner "local-exec" {
    command = "/bin/sh policy.sh"
  }
}