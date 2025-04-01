data "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_range
  region        = var.region
  network       = var.vpc_self_link

  # Melhor prática para evitar destruição acidental
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      # Evita recriação se algo irrelevante mudar
      secondary_ip_range
    ]
  }
}
