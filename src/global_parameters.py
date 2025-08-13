import requests
import json


class config:
    def __init__(self):
        self.dd_actual_version = self.get_actual_version()
        self.dd_actual_champions_list = self.get_actual_champions()
    language = "en_US"
    local_version = "15.15.1"
    def get_actual_version(self):
        actual_version = requests.get("https://ddragon.leagueoflegends.com/api/versions.json").json()[0]
        return actual_version
    
    def get_actual_champions(self):
        actual_champions_id_list = []
        response = requests.get(f"https://ddragon.leagueoflegends.com/cdn/{self.dd_actual_version}/data/{self.language}/champion.json").text
        actual_champions_dict = dict(json.loads(response)["data"])
        for item in actual_champions_dict.values():
            actual_champions_id_list.append(item["name"])
        return actual_champions_id_list