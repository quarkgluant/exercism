def equilateral(sides):
    first, second, third  = sorted(sides)
    return first != 0 and first == second and second == third

def isosceles(sides):
    first, second, third  = sorted(sides)
    return first + second > third and (first == second or second == third)

def scalene(sides):
    first, second, third  = sorted(sides)
    return first + second > third and first != second and second != third