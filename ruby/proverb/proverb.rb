class Proverb
  attr_reader :words, :initial_word

  def initialize(*words, qualifier: qualifier)
    @words = words
    @initial_word = "#{qualifier} #{words.first}".lstrip
  end

  def to_s
    self.words.each_cons(2).with_object("") { |pair, string|
      first_word, second_word = pair
      string << "For want of a #{first_word} the #{second_word} was lost.\n"
    } << "And all for the want of a #{initial_word}."
  end
end