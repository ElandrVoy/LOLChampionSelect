from ruamel.yaml import YAML
import re
from PySide6.QtCore import QUrl, QObject, Signal, Slot

class search(QObject):

    def __init__(self):
        super().__init__()
        yaml = YAML()
        with open('data.yaml', "r") as  file:
            data = yaml.load(file)
        self._champ_list = list(data["champions"].keys())
        self._names_dict = dict(data["champions"])

    @Slot(str, result=str)
    def name(self, string: str):
        return self._names_dict[string]

    @Slot(str, result=list)
    def id(self, string: str):
        if string == "":
            return self._champ_list
        result = []
        pattern = ".*" + ".*".join(list(string)) + ".*"
        for name in self._champ_list:
            if re.fullmatch(pattern, name.lower()):
                result.append(name)
        return result