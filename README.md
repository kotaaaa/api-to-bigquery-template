# API Client Template to store API data into BigQuery

## Technology

- [Cloud Function (Python3.7)](https://cloud.google.com/functions)
- [BigQuery](https://cloud.google.com/bigquery)
- [Cloud Pub/Sub](https://cloud.google.com/pubsub)
- [Cloud Scheduler](https://cloud.google.com/scheduler)

## Data source

- [tmdb api document](https://www.themoviedb.org/documentation/api)

## Setting

```Shell
# Set service account key path
$ export GOOGLE_APPLICATION_CREDENTIALS=キーファイルパス
$ gcloud auth login
```

## Deploy Cloud function app on GCP

```Shell
# terraform set up
$ terraform init
$ terraform apply
```
