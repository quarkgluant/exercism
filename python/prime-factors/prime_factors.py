from math import sqrt, ceil

def factors(value):
    result = []
    stop = 3 * (ceil(sqrt(value)) + 1)
    while value % 2 == 0:
        result.append(2)
        value //= 2
    for div in range(3, stop, 2):
        while value % div == 0:
            result.append(div)
            value //= div

    return result