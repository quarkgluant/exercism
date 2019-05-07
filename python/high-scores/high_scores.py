from heapq import heapify, nlargest

class HighScores(object):
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return max(self.scores)

    def personal_top_three(self):
        # return sorted(self.scores, reverse=True)[0:3]
        heapify(self.scores)
        return nlargest(3, self.scores)