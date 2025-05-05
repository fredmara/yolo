provider "virtualbox" {
  # Requires vagrant-vbguest or plugin support
}

resource "null_resource" "provision_vm" {
  provisioner "local-exec" {
    command = "ansible-playbook -i $ ./inventory.yml ./playbook.yml"
  }
}

resource "local_file" "inventory" {
  content = <<EOT
yolo-ecommerce
127.0.0.1 ansible_connection=local
EOT

  filename = "$ ./inventory.yml"
}