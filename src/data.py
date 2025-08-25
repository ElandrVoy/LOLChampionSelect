import requests
import json
# from ruamel.yaml import YAML
# yaml = YAML()

class server_data:
    def __init__(self):
        self.dd_actual_version = self.get_actual_version()
        self.dd_actual_champion_names_list = self.get_actual_champion_names()
    language = "en_US"
    local_version = "15.15.1"
    def get_actual_version(self):
        actual_version = requests.get("https://ddragon.leagueoflegends.com/api/versions.json").json()[0]
        return actual_version
    
    def get_actual_champion_names(self):
        actual_champions_id_list = []
        response = requests.get(f"https://ddragon.leagueoflegends.com/cdn/{self.dd_actual_version}/data/{self.language}/champion.json").text
        actual_champions_dict = dict(json.loads(response)["data"])
        for item in actual_champions_dict.values():
            actual_champions_id_list.append(item["name"])
        return actual_champions_id_list
    

dt = server_data()

# class local_data:

#     @staticmethod
#     def update_data():
#         with open('data.yaml', "r") as  file:
#             data = yaml.load(file)
#             data['champions'] = dt.dd_actual_champion_names_list
#         with open('data.yaml', 'w') as file:
#             yaml.dump(data, file)

# dict1 = {}
# s = server_data()
# l1 = s.dd_actual_champion_names_list
# response = requests.get(f"https://ddragon.leagueoflegends.com/cdn/{s.dd_actual_version}/data/en_US/champion.json").text
# d = list(json.loads(response)["data"].keys())
# yaml = YAML()
# with open('data.yaml', "r") as  file:
#     temp = yaml.load(file)
#     for i in range(len(l1)):
#         dict1[d[i]] = l1[i]
#     temp["champions"] = dict1

# with open('data.yaml', 'w') as file:
#     yaml.dump(temp, file)