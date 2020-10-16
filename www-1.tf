resource "digitalocean_kubernetes_cluster" "www-1" {
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-1gb"
    node_count = 1
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }

  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  image = "ubuntu-18-04-x64"
  name = "www-1"
  private_networking = true
  region = "sfo2"
  # size = "s-1vcpu-1gb"
  # try removing the `node_pool` section below and adding `size` above
  tags    = ["production"]
  version = "1.15.5-do.1"
}
