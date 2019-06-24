def response(hey_bob):
    phrase = Phrase(hey_bob)

    if phrase.is_silence():
        return 'Fine. Be that way!'
    elif phrase.is_shouting() and phrase.is_questioning():
        return 'Calm down, I know what I\'m doing!'
    elif phrase.is_shouting():
        return 'Whoa, chill out!'
    elif phrase.is_questioning():
        return 'Sure.'
    else:
        return 'Whatever.'

class Phrase():
    def __init__(self, message):
        self.message = message.strip()

    def is_silence(self):
        return self.message.isspace() or len(self.message.strip()) == 0

    def is_questioning(self):
        return self.message.endswith("?")

    def is_shouting(self):
        return self.message.isupper()