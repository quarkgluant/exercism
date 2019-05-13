# Score categories
# Change the values as you see fit

import re

YACHT = (r'([1-6])\1\1\1\1', lambda dice: 50)
ONES = (r'(?P<one>1{1,5})[2-6]{0,4}', lambda dice: dice.count(1))
TWOS = (r'1{0,4}(?P<two>2{1,5})[3-6]{0,4}', lambda dice: 2 * dice.count(2))
THREES = (r'[12]{0,4}(?P<three>3{1,5})[4-6]{0,4}', lambda dice: 3 * dice.count(3))
FOURS = (r'[123]{0,4}(?P<four>4{1,5})[56]{0,4}', lambda dice: 4 * dice.count(4))
FIVES = (r'[1-4]{0,4}(?P<five>5{1,5})6{0,4}', lambda dice: 5 * dice.count(5))
SIXES = (r'[1-5]{0,4}(?P<six>6{1,5})', lambda dice: 6 * dice.count(6))
FULL_HOUSE = (r'(?:([1-6])\1\1(?!\1\1)([1-6])\2)|(?:([1-6])\3(?!\3\3)([1-6])\4\4)', lambda dice: sum(dice))
FOUR_OF_A_KIND = (r'[1-6]{0,1}([1-6])\1\1\1[1-6]{0,1}', lambda dice: sum(4 * val for val in set(dice) if dice.count(val) >= 4))
LITTLE_STRAIGHT = (r'12345', lambda dice: 30)
BIG_STRAIGHT = (r'23456', lambda dice: 30)
CHOICE = (r'[1-6]{5}', lambda  dice: sum(dice))


def score(dice, category):
    pattern = re.compile(category[0])
    string = ''.join([str(dice) for dice in sorted(dice)])
    if pattern.match(string):
        return category[1](dice)
    else:
        return 0



