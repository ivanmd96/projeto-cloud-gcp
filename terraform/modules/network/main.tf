data "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
}

data "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
}

