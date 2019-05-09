import re

class Phone(object):
    def __init__(self, phone_number):
        self.phone_number = ''.join([char for char in list(phone_number) if char.isdigit()])

        if not ((len(self.phone_number) == 10) or (len(self.phone_number) == 11 and self.phone_number[0] == '1')):
            raise ValueError("invalid format, tooshort or not starts with 1 for 11 digits number")

        if len(self.phone_number) == 10:
            self.number = self.phone_number
        else:
            self.number = self.phone_number[1:11]

        self.area_code = self.number[0:3]

        first_area_code_digit = self.area_code[0]
        if first_area_code_digit == '0' or first_area_code_digit == '1':
            raise ValueError("area code starts with zéro or one")

        first_exchange_code_digit = self.number[3]
        if first_exchange_code_digit == '0' or first_exchange_code_digit == '1':
            raise ValueError("exchange code starts with zéro or one")

    def pretty(self):
        return f"({self.area_code}) {self.number[3:6]}-{self.number[6:]}"


