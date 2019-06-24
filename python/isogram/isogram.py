import re

def is_isogram(string):
    pattern = re.compile(r'[^\w]')
    cleaned = pattern.sub('', string.lower())
    return len(list(cleaned)) == len(set(list(cleaned)))
