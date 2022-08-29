import os
import base64
import datetime
import numpy as np
from dotenv import load_dotenv
from api_client import apiclient
from google.cloud import bigquery

load_dotenv(".env")
GCP_PROJECT = os.environ.get("GCP_PROJECT")


def insert_bq_tmdb_data(event, context):

    # Construct a BigQuery client object.
    client = bigquery.Client()
    tmdbclient = apiclient()
    rows_to_insert = tmdbclient.call_tmdb_trending(
        media_type="movie", time_window="day"
    )

    errors = client.insert_rows_json(
        GCP_PROJECT + ".collecting_db.tmdb_trending", rows_to_insert
    )  # Make an API request.
    if errors == []:
        print("New rows have been added.")
    else:
        print("Encountered errors while inserting rows: {}".format(errors))


# if __name__ == "__main__":
#     insert_bq_tmdb_data(event, context)