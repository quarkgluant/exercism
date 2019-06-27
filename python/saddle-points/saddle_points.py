def saddle_points(matrix):
    for row in matrix:
            if len(row) != len(matrix[-1]):
                raise ValueError("matrix must be regular")

    result = [{'row': abscissa + 1, 'column': ordinate + 1} \
              for ordinate, col in enumerate(list(zip(*matrix))) \
              for abscissa, row in enumerate(matrix) \
              if min(col) == max(row)]
    return [{}] if len(result) == 0 else result
