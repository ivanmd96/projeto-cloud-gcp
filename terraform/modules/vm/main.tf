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
  network    = var.network_id       # já existente
  subnetwork = var.subnetwork_id    # já existente
  access_config {}
}

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}
