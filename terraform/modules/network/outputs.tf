output "vpc_id" {
  description = "ID da VPC criada"
  value       = data.google_compute_network.vpc_network.id
}

output "subnet_id" {
  description = "ID da Subrede criada"
  value       = data.google_compute_subnetwork.subnet.id
}
