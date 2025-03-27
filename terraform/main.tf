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
  subnetwork_id    = data.google_compute_subnetwork.subnet.id  # ← valor vindo do output do módulo network
  network_id       = data.google_compute_network.vpc_network.id    # ← valor vindo do output do módulo network
  ssh_public_key   = var.ssh_public_key
}

data "google_compute_network" "vpc_network" {
  name    = var.vpc_name
  project = var.project_id
}

# Criação da sub-rede baseada no ambiente
module "network" {
  source        = "./modules/network"
  vpc_name      = var.vpc_name
  subnet_name   = var.subnet_name
  subnet_range  = var.subnet_range
  region        = var.region
}