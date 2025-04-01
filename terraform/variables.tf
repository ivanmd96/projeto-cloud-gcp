variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
  default     = "projeto-cloud-estudo"
}

variable "region" {
  description = "Região onde os recursos serão criados"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zona onde a VM será criada"
  type        = string
  default     = "us-central1-a"
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
  default     = "projeto-cloud"
}

variable "subnet_name" {
  description = "Nome da subrede"
  type        = string
  default     = "projeto-1"
}

variable "create_subnet" {
  type    = bool
  default = true
}

variable "subnet_range" {
  type = string
}

variable "vm_name" {
  description = "Nome da VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo da máquina"
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

variable "credentials_path" {
  description = "Caminho do arquivo de credenciais do GCP passado via Jenkins"
  type        = string
}

