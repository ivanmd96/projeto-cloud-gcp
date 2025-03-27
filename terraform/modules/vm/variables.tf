variable "vm_name" {
  description = "Nome da VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo da máquina"
  type        = string
}

variable "zone" {
  description = "Zona onde a VM será criada"
  type        = string
}

variable "vm_image" {
  description = "Imagem do SO da VM"
  type        = string
}

variable "ssh_public_key" {
  description = "Conteúdo da chave pública SSH"
  type        = string
}

variable "network_id" {
  description = "ID da rede"
  type        = string
}

variable "subnetwork_id" {
  description = "ID da subrede"
  type        = string
}
