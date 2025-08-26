import json
import re
from PySide6.QtCore import QUrl, QObject, Signal, Slot

class search(QObject):

    def __init__(self):
        super().__init__()
        with open('champion_data1.json', "r") as  file:
            file_data = json.load(file)
        self._champ_list = self._full_list = list(file_data["data"].keys())
        self.data = file_data
        self.filters = []
        self.number_of_sorted = "171/171"

        self.tags = {"Top" : [], "Mid" : [], "Jungle" : [], "Adc" : [], "Support" : [], "Mage" : [], "Assasin" : [], "Tank": [], 'Fighter' : [], 'Marksman' : []}
        for key in self.tags:
            for champ in file_data["data"]:
                if key in file_data["data"][champ]["tags"]:
                    self.tags[key].append(champ)

    @Slot(str)
    def add_filter(self, string: str):
        self.filters.append(string)     
    
    @Slot(str)
    def del_filter(self, string: str):
        if string == "all":
            self.filters = []
        else:
            self.filters.remove(string)

    def apply_filters(self, input: list, filters: list):
        if len(filters) == 0:
            self.number_of_sorted = "171/171"
            return input
        s = set()
        for item in filters:
            temp = set(input).intersection(self.tags[item])
            s.update(temp)
        return sorted(list(s))

    @Slot(result=str)
    def get_number_of_sorted(self):
        return self.number_of_sorted
    
    @Slot(str, result=str)
    def name(self, string: str):
        return self.data["data"][string]["name"]

    @Slot(str, result=list)
    def id(self, string: str):
        if string == "":
            self.number_of_sorted = f"{len(self.apply_filters(self._full_list, self.filters))}/171"
            return self.apply_filters(self._full_list, self.filters)
        result = []
        pattern = ".*" + ".*".join(list(string)) + ".*"
        for name in self._champ_list:
            if re.fullmatch(pattern, name.lower()):
                result.append(name)
        result = self.apply_filters(result, self.filters)
        self.number_of_sorted = f"{len(result)}/171"
        return result