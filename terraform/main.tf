provider "google" {
  credentials = file(var.credentials_file) # ou o caminho correto na sua máquina
  project     = var.project_id
  region      = var.region
}

module "vm" {
  source           = "./modules/vm"
  vm_name          = var.vm_name
  machine_type     = var.machine_type
  vm_image         = var.vm_image
  ssh_key_path     = var.ssh_key_path
  zone             = var.zone
  subnetwork_id    = module.network.subnet_id  # ← valor vindo do output do módulo network
  network_id       = module.network.vpc_id      # ← valor vindo do output do módulo network
  ssh_public_key   = var.ssh_public_key
}

module "network" {
  source        = "./modules/network"
  vpc_name      = var.vpc_name
  subnet_name   = var.subnet_name
  subnet_range  = var.subnet_range
  region        = var.region
}

module "firewall" {
  source     = "./modules/firewall"
  network_id = module.network.vpc_id
}

