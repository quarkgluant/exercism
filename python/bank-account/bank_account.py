class BankAccount(object):
    def __init__(self):
        self.account = None

    def get_balance(self):
        if self._check_account():
            return sum(self.account)

    def open(self):
        if self.account == None:
            self.account = [0]
        else:
            raise ValueError("account already open")


    def deposit(self, amount):
        if self._check_account() and amount >= 0:
            self.account.append(amount)
        else:
            raise ValueError("amount negative")


    def withdraw(self, amount):
        if amount <= 0:
            raise ValueError("withdrawning a negative amount is more like a deposit !")
        if self._check_account() and self.get_balance() >= amount:
            self.account.append(-amount)
        else:
            raise ValueError("withdraw greater than your balance")

    def close(self):
        if self._check_account():
            self.account = None

    def _check_account(self):
        if self.account:
            return True
        else:
            raise ValueError("account not in activity")