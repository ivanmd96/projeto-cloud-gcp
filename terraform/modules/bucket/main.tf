resource "google_storage_bucket" "terraform_state" {
  count    = var.create_bucket ? 1 : 0
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
