def largest_palindrome(max_factor, min_factor=0):
    all_palindromes = _palindromes(max_factor, min_factor)
    if len(all_palindromes) > 0:
        max_value = max(all_palindromes)[0]
        return (max_value, [pair[1] for pair in all_palindromes if pair[0] == max_value])
    else:
        return [None, []]


def smallest_palindrome(max_factor, min_factor=0):
    all_palindromes = _palindromes(max_factor, min_factor)
    if len(all_palindromes) > 0:
        min_value = min(all_palindromes)[0]
        return (min_value, [pair[1] for pair in all_palindromes if pair[0] == min_value])
    else:
        return [None, []]

def _is_palindrome(number):
    return list(str(number)) == list(reversed(str(number)))

def _palindromes(max_factor, min_factor=0):
    if min_factor > max_factor or min_factor < 0:
        raise ValueError("min_factor > maw_factor")

    return sorted([(first*second, (first, second))
                   for first in range(min_factor, max_factor+1)
                  for second in range(first, max_factor+1)
                   if _is_palindrome(first*second)])
