from math import sqrt, round

def score(x, y):
    impact = _radius(x, y)
    if 10 >= impact > 5:
        return 1
    elif 5 >= impact > 1:
        return 5
    elif impact <= 1:
        return 10
    else:
        return 0

def _radius(x, y):
    return sqrt(x ** 2 + y ** 2)

