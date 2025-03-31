resource "google_storage_bucket" "terraform_state" {
  name     = var.bucket_name
  location = var.bucket_location
  force_destroy = false

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 90
    }
  }
}
