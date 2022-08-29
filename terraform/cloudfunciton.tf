resource "google_storage_bucket" "bucket" {
  name     = "collecting-tf"
  location = "asia-northeast1"
}

data "archive_file" "function_archive" {
  type        = "zip"
  source_dir  = "../src"       # directory for main.py,requirement.txt
  output_path = "../index.zip" # zipped file name
}

resource "google_storage_bucket_object" "archive" {
  name   = "../index.zip"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.function_archive.output_path
}

resource "google_cloudfunctions_function" "function" {
  name        = "function-tdmb"
  description = "Digest tmdb data"
  runtime     = "python37"

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  service_account_email = "terraform-service-account@gcp-compute-engine-343613.iam.gserviceaccount.com"

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = "projects/gcp-compute-engine-343613/topics/streaming-topic"
  }
  entry_point = "insert_bq_tmdb_data"
}
