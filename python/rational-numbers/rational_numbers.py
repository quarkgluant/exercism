from __future__ import division


class Rational(object):
    def __init__(self, numer, denom):

        if denom < 0:
            denom = -denom
            numer = -numer
        else:
            numer = numer
            denom = denom
        self.numer, self.denom = self._symplify(numer, denom)
        if numer == 0:
            self.numer, self.denom = 0, 1

    def __eq__(self, other):
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return '{}/{}'.format(self.numer, self.denom)

    def __add__(self, other):
        if self._same_denom(self, other):
            num = self.numer + other.numer
            denom = self.denom
        else:
            num = self.numer * other.denom + other.numer * self.denom
            denom = self.denom * other.denom
        return Rational(num, denom)

    def __sub__(self, other):
        if self._same_denom(self, other):
            num = self.numer - other.numer
            denom = self.denom
        else:
            num = self.numer * other.denom - other.numer * self.denom
            denom = self.denom * other.denom
        return Rational(num, denom)

    def __mul__(self, other):
        num = self.numer * other.numer
        denom = self.denom * other.denom
        return Rational(num, denom)

    def __truediv__(self, other):
        num = self.numer * other.denom
        denom = self.denom * other.numer
        return Rational(num, denom)

    def __abs__(self):
        return Rational(abs(self.numer), abs(self.denom))

    def __pow__(self, power):
        if power == 0:
            return Rational(1, 1)
        elif power > 0:
            return Rational(self.numer ** power, self.denom ** power)
        else:
            return Rational(self.denom ** power, self.numer ** power)

    def __rpow__(self, base):
        return base ** (self.numer / self.denom)

    def _symplify(self, numer, denom):
        if numer == 0:
            return numer, denom
        for number in range(2, min(abs(numer), abs(denom)) + 1):
            if numer % number == denom % number == 0:
                numer = numer // number
                denom = denom // number
        return numer, denom

    def _same_denom(self, first, other):
        return abs(first.denom) == abs(other.denom)