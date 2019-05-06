import re

def proteins(strand):
    codon_protein = dict(AUG='Methionine',
    UUU='Phenylalanine', UUC='Phenylalanine',
    UUA='Leucine', UUG='Leucine',
    UCU='Serine', UCC='Serine', UCA='Serine', UCG='Serine',
    UAU='Tyrosine', UAC='Tyrosine',
    UGU='Cysteine', UGC='Cysteine',
    UGG='Tryptophan',
    UAA='STOP', UAG='STOP', UGA='STOP')
    codon = re.compile('([ACGU]{3})')
    codons = codon.findall(strand)
    protein = []
    for codon in codons:
        if codon_protein[codon] == 'STOP':
            break
        else:
            protein.append(codon_protein[codon])
    return protein