output "instance_ip" {
  description = "Endereço IP público da VM"
  value       = data.google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}

output "instance_name" {
  value = data.google_compute_instance.vm.name
}

