# BigQuery Database
resource "google_bigquery_dataset" "collecting_db" {
  dataset_id = "collecting_db"
  access {
    role          = "OWNER"
    user_by_email = data.google_service_account.terraform_service_account.email
  }
}

# BigQuery Table
resource "google_bigquery_table" "tmdb_trending" {
  dataset_id = google_bigquery_dataset.collecting_db.dataset_id
  table_id   = "tmdb_trending"
  time_partitioning {
    type = "DAY"
  }
  deletion_protection = false
  schema              = <<EOF
[
  {
    "name": "adult",
    "type": "BOOLEAN",
    "mode": "NULLABLE"
  },
  {
    "name": "backdrop_path",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "id",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "title",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "original_language",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "original_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "original_title",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "overview",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "poster_path",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "media_type",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "genre_ids",
    "type": "INTEGER",
    "mode": "REPEATED"
  },
  {
    "name": "popularity",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "release_date",
    "type": "DATE",
    "mode": "NULLABLE"
  },
  {
    "name": "first_air_date",
    "type": "DATE",
    "mode": "NULLABLE"
  },
  {
    "name": "video",
    "type": "BOOLEAN",
    "mode": "NULLABLE"
  },
  {
    "name": "vote_average",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "vote_count",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "origin_country",
    "type": "STRING",
    "mode": "REPEATED"
  }
]
EOF
}
