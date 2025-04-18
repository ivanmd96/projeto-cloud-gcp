provider "google" {
  credentials = file(var.credentials_path) # ou o caminho correto na sua máquina
  project     = var.project_id
  region      = var.region
}

module "vm" {
  source           = "./modules/vm"
  vm_name          = var.vm_name
  machine_type     = var.machine_type
  vm_image         = var.vm_image
  zone             = var.zone
  subnetwork_id    = module.network.subnet_id  # ← valor vindo do output do módulo network
  network_id       = data.google_compute_network.vpc_network.id    # ← valor vindo do output do módulo network
  ssh_public_key   = var.ssh_public_key
}

data "google_compute_network" "vpc_network" {
  name    = var.vpc_name
  project = var.project_id
}

# Criação da sub-rede baseada no ambiente
module "network" {
  vpc_name       = var.vpc_name
  source         = "./modules/network"
  subnet_name    = var.subnet_name
  region         = var.region
  subnet_range   = var.subnet_range         # ← novo
  create_subnet  = var.create_subnet        # ← novo
  vpc_self_link  = data.google_compute_network.vpc_network.id
}
