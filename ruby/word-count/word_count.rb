class Phrase
  attr_reader :phrase
  WORD_BOUNDARIES = /\b[\w']+\b/

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words.group_by(&:itself).transform_values(&:size)
  end

  private

  def words
    phrase.downcase.scan(WORD_BOUNDARIES)
  end
end
