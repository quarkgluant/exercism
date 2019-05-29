def raindrops(number):
    connections = dict([(3, "Pling"), (5, "Plang"), (7, "Plong")])
    result = [connections[div] for div in connections if number % div == 0]
    if len(result) == 0:
        return f"{number}"
    else:
        return "".join(result)