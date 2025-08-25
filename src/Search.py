import json
import re
from PySide6.QtCore import QUrl, QObject, Signal, Slot

class search(QObject):

    def __init__(self):
        super().__init__()
        with open('champion_data.json', "r") as  file:
            file_data = json.load(file)
        self._champ_list = self._full_list = list(file_data["data"].keys())
        self.data = file_data
        self.filters = []

        self.roles = {"top" : [], "mid" : [], "jungle" : [], "adc" : [], "sup" : []}
        for key in self.roles:
            for champ in file_data["data"]:
                if key in file_data["data"][champ]["position"]:
                    self.roles[key].append(champ)

    @Slot(str)
    def add_filter(self, string: str):
        self.filters.append(string)
        print(self.filters)        
    
    @Slot(str)
    def del_filter(self, string: str):
        self.filters.remove(string)        
        print(self.filters)

    def apply_filters(self, input: list, filters: list):
        if len(filters) == 0:
            return input
        s = set()
        for item in filters:
            temp = set(input).intersection(self.roles[item])
            s.update(temp)
        return sorted(list(s))

    @Slot(str, result=str)
    def name(self, string: str):
        return self.data["data"][string]["name"]

    @Slot(str, result=list)
    def id(self, string: str):
        if string == "":
            return self.apply_filters(self._full_list, self.filters)
        result = []
        pattern = ".*" + ".*".join(list(string)) + ".*"
        for name in self._champ_list:
            if re.fullmatch(pattern, name.lower()):
                result.append(name)
        result = self.apply_filters(result, self.filters)
        return result