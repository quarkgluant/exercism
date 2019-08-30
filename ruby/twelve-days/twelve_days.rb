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
           'twelve Drummers Drumming'
  ]

  def self.recite(first_couplet, last_couplet)
    (first_couplet..last_couplet).each_with_object([]) { |couplet_number, result| result << new.verse(couplet_number) }.flatten
  end

  def self.song
    (1..12).map { |strophe_number| self.recite(strophe_number, strophe_number) }.join("\n\n") + "\n"
  end

  def verse(couplet_number)
    couplet_number -= 1
    initial = "On the #{NUMBER_DAYS[couplet_number]} day of Christmas my true love gave to me: "
    final = ''
    strophe = GIFTS[1..couplet_number].reverse.join(', ')
    final += ', and ' unless strophe.empty?
    final += GIFTS.first + '.'
    [initial + strophe + final]
  end
end
