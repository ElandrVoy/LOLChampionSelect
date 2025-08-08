import sys
import random
import requests
from PySide6 import QtCore, QtWidgets, QtGui
import json

class Champion():
    def __init__(self, name: str):
        self.name = name

class global_parameters():
    def __init__(self):
        self.actual_version = self.get_actual_version()
        self.actual_champions_list = self.get_actual_champions()
    language = "en_US"

    def get_actual_version(self):
        actual_version = requests.get("https://ddragon.leagueoflegends.com/api/versions.json").json()[0]
        return actual_version
    
    def get_actual_champions(self):
        actual_champions_list = []
        response = requests.get(f"https://ddragon.leagueoflegends.com/cdn/{self.actual_version}/data/{self.language}/champion.json").text
        actual_champions_dict = dict(json.loads(response)["data"])
        for item in actual_champions_dict.values():
            actual_champions_list.append(item["name"])
        return actual_champions_list

l = global_parameters()

print(l.actual_champions_list)