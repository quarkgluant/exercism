class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    # downcase_words.group_by(&:itself)
    #               .transform_values { |count| count.size }
    downcase_words.each_with_object(Hash.new(0)) { |(k, v), hash| hash[k] += 1 }
  end

  def downcase_words
    phrase.downcase.scan(/\b[\w']+\b/)
  end
end

