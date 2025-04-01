data "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
}
