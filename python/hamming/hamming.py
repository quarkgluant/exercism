def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must be equal length")

    nucleotides = zip(list(strand_a), list(strand_b))
    return sum(pairs[0] != pairs[1] for pairs in list(nucleotides))