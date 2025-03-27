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
  network_id       = module.network.vpc_id      # ← valor vindo do output do módulo network
  ssh_public_key   = var.ssh_public_key
}

data "google_compute_subnetwork" "subnet" {
  name   = var.subnet_name
  region = var.region
  project = var.project_id
}