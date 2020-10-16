terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

# these variables are passed in with:
# terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa_digital_ocean"
variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "local"
}


provider "kubernetes" {
  name = "www-1"
  load_config_file = false
  host  = data.digitalocean_kubernetes_cluster.www-1.endpoint
  token = data.digitalocean_kubernetes_cluster.www-1.kube_config[0].token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.www-1.kube_config[0].cluster_ca_certificate
  )
  region       = "sfo2"
  auto_upgrade = true
  version = "1.13.2"
}


resource "digitalocean_kubernetes_cluster" "www-1" {
  name = "www-1"
  region = "sfo2"
  version = "1.18.8-do.1"
  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}
