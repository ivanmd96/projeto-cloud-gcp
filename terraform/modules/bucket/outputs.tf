output "bucket_name" {
  value = google_storage_bucket.terraform_state[0].name
}
