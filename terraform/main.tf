provider "google" {
  credentials = file(var.credentials_file) # ou o caminho correto na sua máquina
  project     = var.project_id
  region      = var.region
}

module "vm" {
  source         = "./modules/vm"
  vm_name        = var.vm_name
  machine_type   = var.machine_type
  zone           = var.zone
  vm_image       = var.vm_image
  ssh_key_path   = var.ssh_key_path
  network        = module.network.vpc_id
  subnetwork     = module.network.subnet_id
}

module "network" {
  source       = "./modules/network"
  vpc_name     = var.vpc_name
  subnet_name  = var.subnet_name
  region       = var.region
  subnet_range = var.subnet_range
}

module "firewall" {
  source  = "./modules/firewall"
  network = module.network.vpc_id
}

