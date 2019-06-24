def steps(number):
    if number <= 0:
        raise ValueError("number must be strictly posisitve")
    return count_steps(number, 0)

def count_steps(number, step = 0):
    if number == 1:
        return step
    else:
        step += 1
        number = number / 2 if number % 2 == 0 else 3 * number + 1
        return count_steps(number, step)
