# resource "digitalocean_kubernetes_cluster" "www-1" {
#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "2m"
#   }

#   node_pool {
#     name       = "worker-pool"
#     size       = "s-1vcpu-1gb"
#     node_count = 1
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "export PATH=$PATH:/usr/bin",
#       # install nginx
#       "sudo apt-get update",
#       "sudo apt-get -y install nginx"
#     ]
#   }

#   # x - ssh_keys = [
#   #   data.digitalocean_ssh_key.terraform.id
#   # ]

#   # x - image = "ubuntu-18-04-x64"
#   name = "www-1"
#   # x - private_networking = true
#   region = "sfo2"
#   # size = "s-1vcpu-1gb"
#   # try removing the `node_pool` section below and adding `size` above
#   tags    = ["production"]
#   version = "1.18.8-do.1"
# }





# data "digitalocean_kubernetes_cluster" "example" {
#   name = "prod-cluster-01"
# }

# provider "kubernetes" {
#   load_config_file = false
#   host  = data.digitalocean_kubernetes_cluster.example.endpoint
#   token = data.digitalocean_kubernetes_cluster.example.kube_config[0].token
#   cluster_ca_certificate = base64decode(
#     data.digitalocean_kubernetes_cluster.example.kube_config[0].cluster_ca_certificate
#   )
# }

# data "digitalocean_kubernetes_versions" "example" {
#   version_prefix = "1.18."
# }

# resource "digitalocean_kubernetes_cluster" "www-1" {
#   name         = "www-1"
#   region       = "sfo2"
#   auto_upgrade = true
#   version      = data.digitalocean_kubernetes_versions.example.latest_version

#   node_pool = [
#     {
#       name       = "worker-pool"
#       size       = "s-1vcpu-1gb"
#       node_count = 1
#     },
#   ]

# }


# data "digitalocean_kubernetes_cluster" "www-1" {
# }

