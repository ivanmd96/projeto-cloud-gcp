resource "google_compute_subnetwork" "subnet" {
  count         = var.create_subnet ? 1 : 0
  name          = var.subnet_name
  ip_cidr_range = var.subnet_range
  region        = var.region
  network       = var.vpc_self_link
}