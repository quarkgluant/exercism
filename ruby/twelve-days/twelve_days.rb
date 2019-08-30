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

  def self.song
    new.all_the_song
  end

  def recite(first_couplet, last_couplet)
    (first_couplet..last_couplet).each_with_object([]) do |couplet_number, result|
      result << verse(couplet_number)
    end.flatten
  end

  def all_the_song
    (1..12).map do |strophe_number|
      recite(strophe_number, strophe_number)
    end.join("\n\n") + "\n"
  end

  def verse(couplet_number)
    couplet_number -= 1
    strophe = GIFTS[1..couplet_number].reverse.join(', ')
    ["On the #{NUMBER_DAYS[couplet_number]} day of Christmas my true love gave to me: " +
         strophe + "#{strophe.empty? ? '' : ', and '}" + GIFTS.first + '.']
  end
end
