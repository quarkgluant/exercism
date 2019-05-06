def is_pangram(sentence):
    set_sentence = set(list(sentence.lower()))
    set_other = set([str(number) for number in range(10)]) | {' ', '_', '"', '.'}
    return len(set_sentence - set_other) == 26
