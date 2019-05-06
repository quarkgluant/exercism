from random import choices, seed
from string import ascii_uppercase, digits

class Robot(object):
    already_used_names = []

    def __init__(self):
        seed()
        self.name = self._rename()

    def _rename(self):
        self.name = ''.join(choices(ascii_uppercase, k=2) + choices(digits, k=3))
        if self.name in self.already_used_names:
            self._rename()
        else:
            self.already_used_names.append(self.name)
            return self.name

    def reset(self):
        self.name = self._rename()