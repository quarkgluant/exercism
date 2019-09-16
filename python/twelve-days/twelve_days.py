def recite(start_verse, end_verse):
    return  [verse(number, number)[0] for number in range(start_verse, end_verse + 1)]

def verse(start_verse, end_verse):
    GIFTS = ["a Partridge in a Pear Tree.",
             "two Turtle Doves",
             "three French Hens",
             "four Calling Birds",
             "five Gold Rings",
             "six Geese-a-Laying",
             "seven Swans-a-Swimming",
             "eight Maids-a-Milking",
             "nine Ladies Dancing",
             "ten Lords-a-Leaping",
             "eleven Pipers Piping",
             "twelve Drummers Drumming",
             ]
    NUMBER_DAYS = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

    return [f"On the {NUMBER_DAYS[start_verse - 1]} day of Christmas my true love gave to me: "
            f"{(', ').join(GIFTS[end_verse - 1:0:-1])}{', and ' if (start_verse > 1) else ''}{GIFTS[0]}"]