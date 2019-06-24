def classify(number):
    if number <= 0:
        raise ValueError('then number must be strictly posistive')

    sum = sum_aliquots(number)
    if sum == number:
        return 'perfect'
    elif sum > number:
        return 'abundant'
    else:
        return 'deficient'

def sum_aliquots(number):
    return sum(set([div for div in range(1, number) if number % div == 0]))