terraform {
  backend "gcs" {
    bucket = "terraform-state-projeto-cloud"
    prefix = "env/dev"
  }
}