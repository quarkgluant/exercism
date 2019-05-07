def verify(isbn):
    isbn_str_list = [char for char in list(isbn) if char != '-']
    if len(isbn_str_list) != 10:
        return False
    if isbn_str_list[-1] == 'X':
        isbn_str_list[-1] = '10'
    for char in isbn_str_list:
        if not char.isdigit():
            return False
    isbn = [int(char) for char in isbn_str_list]
    return (isbn[0] * 10 + isbn[1] * 9 + isbn[2] * 8 + isbn[3] * 7 +
     isbn[4] * 6 + isbn[5] * 5 + isbn[6] * 4 + isbn[7] * 3 +
     isbn[8] * 2 + isbn[9] * 1) % 11 == 0
