class Acronym
  WORD_BOUNDARIES =  /\b\w/

  def self.abbreviate(phrase)
    phrase.scan(WORD_BOUNDARIES).join.upcase
  end

end
