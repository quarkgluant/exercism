def raindrops(number):
    result = ""
    if number % 3 == 0:
        result += "Pling"
    if number % 5 == 0:
        result += "Plang"
    if number % 7 == 0:
        result += "Plong"
    if not (number % 3 == 0 or number % 5 == 0 or number % 7 == 0):
        result = f"{number}"
    return result