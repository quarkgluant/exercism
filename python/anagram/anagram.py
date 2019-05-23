def find_anagrams(word, candidates):
    return [candidat for candidat in candidates
            if sorted(list(candidat.lower())) == sorted(list(word.lower()))
            and candidat.lower() != word.lower()]
