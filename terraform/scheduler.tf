resource "google_cloud_scheduler_job" "job" {
  name        = "cron-job"
  description = "cron job"
  schedule    = "0 12 * * *" // Every 12 o'clock
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("test")
  }
}
