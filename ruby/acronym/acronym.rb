class Acronym
  WORD_BOUNDARIES = /\w+/

  def self.abbreviate(phrase)
    @phrase = phrase
    words.map do |word|
      first_letter(word)
    end.join
  end

  private

  def self.words
    @phrase.scan(WORD_BOUNDARIES)
  end

  def self.first_letter(word)
    word.upcase.split('').first
  end

end
