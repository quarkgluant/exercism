def to_rna(dna_strand):
    rna_transcript = dict(zip(['A', 'C', 'G', 'T'], ['U', 'G', 'C', 'A']))
    return ''.join([rna_transcript[char] for char in list(dna_strand)])
