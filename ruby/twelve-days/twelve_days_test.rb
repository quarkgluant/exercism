require 'minitest/autorun'
require_relative 'twelve_days'

class TwelveDaysTest < Minitest::Test
  def test_verse1
    expected = ['On the first day of Christmas my true love gave to me: ' +
                    'a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(1, 1)
  end

  def test_verse2
    expected = ['On the second day of Christmas my true love gave to me: ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(2, 2)
  end

  def test_verse3
    expected = ['On the third day of Christmas my true love gave to me: ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(3, 3)
  end

  def test_verse4
    expected = ['On the fourth day of Christmas my true love gave to me: ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(4, 4)
  end

  def test_verse5
    expected = ['On the fifth day of Christmas my true love gave to me: ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(5, 5)
  end

  def test_verse6
    expected = ['On the sixth day of Christmas my true love gave to me: ' +
                    'six Geese-a-Laying, ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(6, 6)
  end

  def test_verse7
    expected = ['On the seventh day of Christmas my true love gave to me: ' +
                    'seven Swans-a-Swimming, ' +
                    'six Geese-a-Laying, ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(7, 7)
  end

  def test_verse8
    expected = ['On the eighth day of Christmas my true love gave to me: ' +
                    'eight Maids-a-Milking, ' +
                    'seven Swans-a-Swimming, ' +
                    'six Geese-a-Laying, ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(8, 8)
  end

  def test_verse9
    expected = ['On the ninth day of Christmas my true love gave to me: ' +
                    'nine Ladies Dancing, ' +
                    'eight Maids-a-Milking, ' +
                    'seven Swans-a-Swimming, ' +
                    'six Geese-a-Laying, ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(9, 9)
  end

  def test_verse10
    expected = ['On the tenth day of Christmas my true love gave to me: ' +
                    'ten Lords-a-Leaping, ' +
                    'nine Ladies Dancing, ' +
                    'eight Maids-a-Milking, ' +
                    'seven Swans-a-Swimming, ' +
                    'six Geese-a-Laying, ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(10, 10)
  end

  def test_verse11
    expected = ['On the eleventh day of Christmas ' +
                    'my true love gave to me: ' +
                    'eleven Pipers Piping, ' +
                    'ten Lords-a-Leaping, ' +
                    'nine Ladies Dancing, ' +
                    'eight Maids-a-Milking, ' +
                    'seven Swans-a-Swimming, ' +
                    'six Geese-a-Laying, ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(11, 11)
  end

  def test_verse12
    expected = ['On the twelfth day of Christmas my true love gave to me: ' +
                    'twelve Drummers Drumming, ' +
                    'eleven Pipers Piping, ' +
                    'ten Lords-a-Leaping, ' +
                    'nine Ladies Dancing, ' +
                    'eight Maids-a-Milking, ' +
                    'seven Swans-a-Swimming, ' +
                    'six Geese-a-Laying, ' +
                    'five Gold Rings, ' +
                    'four Calling Birds, ' +
                    'three French Hens, ' +
                    'two Turtle Doves, ' +
                    'and a Partridge in a Pear Tree.']
    assert_equal expected, TwelveDays.new.recite(12, 12)
  end

  # This test is an acceptance test.
  #
  # If you find it difficult to work the problem with so much
  # output, go ahead and add a `skip`, and write whatever
  # unit tests will help you. Then unskip it again
  # to make sure you got it right.
  # There's no need to submit the tests you write, unless you
  # specifically want feedback on them.
  def test_the_whole_song
    song_file = File.expand_path('../song.txt', __FILE__)
    expected = IO.read(song_file)
    assert_equal expected, TwelveDays.song
  end
end
