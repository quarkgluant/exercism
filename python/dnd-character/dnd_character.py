from random import choices, sample
from math import  floor

DICE = (1, 2, 3, 4, 5, 6)

class Character:

    def __init__(self):
        self.strength = self._init_abilitie()
        self.dexterity = self._init_abilitie()
        self.constitution = self._init_abilitie()
        self.intelligence = self._init_abilitie()
        self.wisdom = self._init_abilitie()
        self.charisma = self._init_abilitie()
        self.hitpoints = 10 + modifier(self.constitution)

    def ability(self):
        return sample([self.strength, self.dexterity, self.constitution,
                       self.intelligence, self.wisdom, self.charisma], k=1)[0]

    def _init_abilitie(self):
        return sum(sorted(choices(DICE, k= 4))[1:])

def modifier(quantity):
    return floor((quantity - 10) / 2)