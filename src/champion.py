import requests
import os
from global_parameters import Global_parameters

class Champion():
    def __init__(self, name: str):
        self.name = name

    def download_icon(self):
        response = requests.get(f"https://ddragon.leagueoflegends.com/cdn/{Global_parameters.local_version}/img/champion/{self.name}.png", stream=True)
        if response.status_code == 200:
            save_path = f"img/{self.name}.png"
            os.makedirs(os.path.dirname(save_path), exist_ok=True)
            with open(save_path, "wb") as file: 
                file.write(response.content)
        else:
            print(f"Ошибка загрузки: {response.status_code}")