import os
import requests
from dotenv import load_dotenv


class apiclient:
    def __init__(self):
        load_dotenv(".env")
        self.api_key = os.environ.get("TMDB_KEY")

    def call_tmdb_trending(self, media_type="all", time_window="week"):
        url = (
            "https://api.themoviedb.org/3/trending/"
            + media_type
            + "/"
            + time_window
            + "?api_key="
            + self.api_key
        )
        try:
            result = requests.get(url).json()["results"]
        except:
            raise Exception("API client error.")
        return result