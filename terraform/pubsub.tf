resource "google_pubsub_topic" "topic" {
  name = "streaming-topic"
 
  labels = {
    purpose = "tmdb"
  }
}