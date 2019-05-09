# Game status categories
# Change the values as you see fit
STATUS_WIN = "win"
STATUS_LOSE = "lose"
STATUS_ONGOING = "ongoing"


class Hangman(object):
    def __init__(self, word):
        self.remaining_guesses = 9
        self.status = STATUS_ONGOING
        self.word = word
        self.mask = list('_' * len(word))

    def guess(self, char):
        if self.remaining_guesses < 0 or '_' not in self.mask:
            raise ValueError("too many guess or game over")

        # indexes = [index for cha, index in enumerate(self.word) if cha == char]
        if char in self.word and char not in self.mask:
            for index, character in enumerate(self.word):
                if character == char:
                    self.mask[index] = char
        else:
            self.remaining_guesses -= 1


    def get_masked_word(self):
        return ''.join(self.mask)

    def get_status(self):
        if self.remaining_guesses >= 0:
            if not '_' in self.mask:
                return STATUS_WIN
            else:
                return STATUS_ONGOING
        else:
            return STATUS_LOSE
