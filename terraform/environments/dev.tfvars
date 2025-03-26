project_id     = "projeto-cloud-estudo"
region         = "us-central1"
zone           = "us-central1-a"
vpc_name       = "vpc-dev"
subnet_name    = "subnet-dev"
subnet_range   = "192.168.10.0/24"
vm_name        = "vm-dev"
machine_type   = "e2-medium"
vm_image       = "ubuntu-os-cloud/ubuntu-2004-lts"
credentials_file = "../terraform-key.json"
