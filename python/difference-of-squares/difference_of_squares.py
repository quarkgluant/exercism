def square_of_sum(count):
    return sum([number for number in range(count + 1)])**2


def sum_of_squares(count):
    return sum([number**2 for number in range(count +1)])


def difference(count):
    return square_of_sum(count) - sum_of_squares(count)
