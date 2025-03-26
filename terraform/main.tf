provider "google" {
    credentials = file(var.credentials_file) # ou o caminho correto na sua máquina
  project     = var.project_id
  region      = var.region
}

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
    network    = data.google_compute_network.vpc_network.id
    subnetwork = data.google_compute_subnetwork.subnet.id
    access_config {}
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }
}

data "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
}

data "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = data.google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

