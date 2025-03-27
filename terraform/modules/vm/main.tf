resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  network_interface {
    network    = data.google_compute_network.vpc_network.id      # ← recebido do módulo principal
    subnetwork = data.google_compute_subnetwork.subnet.id    # ← recebido do módulo principal
    access_config {}
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}
