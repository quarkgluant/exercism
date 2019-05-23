class Matrix(object):
    def __init__(self, matrix_string):
        matrix_str = [sub_str.split(' ') for sub_str in matrix_string.splitlines()]
        self.matrix = [[int(number_str) for number_str in row] for row in matrix_str]

    def row(self, index):
        return self.matrix[index - 1]

    def column(self, index):
        return [row[index - 1] for row in self.matrix]
