def slices(series, length):
    if length <= 0 or len(series) < length:
        raise ValueError("input value not valid")

    return [series[index:length + index] for index in range(len(series) - length + 1)]


