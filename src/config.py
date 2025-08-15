from ruamel.yaml import YAML

yaml = YAML()

class config:
    def __init__(self) -> None:
        with open('config.yaml', "r") as  file:
            data = yaml.load(file)
            self.local_version = data['local_version']
            self.selected_lenguage = data['selected_lenguage']
