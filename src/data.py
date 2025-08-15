import requests
import json
from ruamel.yaml import YAML
import champion
yaml = YAML()

class server_data:
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
    

dt = server_data()

class local_data:

    @staticmethod
    def update_data():
        with open('data.yaml', "r") as  file:
            data = yaml.load(file)
            data['champions'] = dt.dd_actual_champions_list
        with open('data.yaml', 'w') as file:
            yaml.dump(data, file)

local_data.update_data()