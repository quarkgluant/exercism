def on_square(integer_number):
    check_value(integer_number)
    return 1 << (integer_number - 1)


def total_after(integer_number):
    check_value(integer_number)
    return sum([on_square(number) for number in range(1, integer_number + 1)])

def check_value(integer_number):
    if integer_number not in range(1, 65):
        raise ValueError("the value must be beetween 1 and 64 inclusive")