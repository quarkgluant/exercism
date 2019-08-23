class TwelveDays
  NUMBER_DAYS = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
  GIFTS = ['a Partridge in a Pear Tree',
           'two Turtle Doves',
           'three French Hens',
           'four Calling Birds',
           'five Gold Rings',
           'six Geese-a-Laying',
           'seven Swans-a-Swimming',
           'eight Maids-a-Milking',
           'nine Ladies Dancing',
           'ten Lords-a-Leaping',
           'eleven Pipers Piping',
           'twelve Drummers Drumming',
  ]

  def self.song
    (1..12).map { |number| self.recite(number, number) }.join("\n\n") + "\n"
  end

  def self.recite(first, last)
    (first..last).each_with_object([]) { |number, result| result << new.verse(number) }.flatten
  end

  def verse(number)
    number -= 1
    initial = "On the #{NUMBER_DAYS[number]} day of Christmas my true love gave to me: "
    final = ''
    strophe = GIFTS[1..number].reverse.join(', ')
    final += ', and ' unless strophe.empty?
    final += GIFTS.first + '.'
    [initial + strophe + final]
  end
end
