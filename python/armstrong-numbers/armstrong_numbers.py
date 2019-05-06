def is_armstrong(number):
    list_char = list(str(number))
    power = len(list_char)
    return sum([(int(char) ** power) for char in list_char]) == number


