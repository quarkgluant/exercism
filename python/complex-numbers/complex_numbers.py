from math import sqrt, cos, sin, exp

class ComplexNumber(object):
    def __init__(self, real, imaginary):
        self.real = real
        self.imaginary = imaginary

    def __eq__(self, other):
        return self.real == other.real and self.imaginary == other.imaginary

    def __add__(self, other):
        real, imaginary = self.real + other.real, self.imaginary + other.imaginary
        return ComplexNumber(real, imaginary)

    def __mul__(self, other):
        a, c = self.real, other.real
        b, d = self.imaginary, other.imaginary
        real, imaginary = a * c - b * d, b * c + a * d
        return ComplexNumber(real, imaginary)

    def __sub__(self, other):
        real, imaginary = self.real - other.real, self.imaginary - other.imaginary
        return ComplexNumber(real, imaginary)

    def __truediv__(self, other):
        a, c = self.real, other.real
        b, d = self.imaginary, other.imaginary
        real, imaginary = (a * c + b * d)/(c**2 + d**2), (b * c - a * d)/(c**2 + d**2)
        return ComplexNumber(real, imaginary)

    def __abs__(self):
        return sqrt(self.real**2 + self.imaginary**2)

    def conjugate(self):
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        real = exp(self.real) * cos(self.imaginary)
        imaginary = exp(self.real) * sin(self.imaginary)
        return ComplexNumber(real, imaginary)
