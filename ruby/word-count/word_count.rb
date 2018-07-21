class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    array_words = phrase.split(/[^\d\w\']/)
    return { phrase => 1 } if array_words.length == 1
    array_words.reject{ |item| item.size.zero? }
                .map(&:downcase)
                .map { |item|  /\'(\w+?)\'/.match(item) ? /\'(\w+?)\'/.match(item)[1] : item }
                .group_by(&:itself)
                .each_with_object({}) { |(k, v), hash| hash[k] = v.size }
  end
end

module  BookKeeping
  VERSION = 1
end