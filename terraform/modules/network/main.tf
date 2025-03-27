resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_range
  region        = var.region
  network       = data.google_compute_network.vpc_network.id

  lifecycle {
    prevent_destroy = true
  }
}