from math import sqrt, ceil

def factors(value):
    result = []
    stop = ceil(sqrt(value)) + 1
    for div in range(2, stop):
        while value % div == 0:
            result.append(div)
            value /= div
            # if (div != value // div and value // div != value):
            #     # Don't add the square root twice and the value!
            #     result.append(value // div);
        if div % 2 == 0:
            continue


    return result