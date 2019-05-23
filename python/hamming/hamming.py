def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must be equal length")

    nucleotides = zip(list(strand_a), list(strand_b))
    distance = 0
    for pairs in list(nucleotides):
        if pairs[0] != pairs[1]:
            distance += 1
    return distance