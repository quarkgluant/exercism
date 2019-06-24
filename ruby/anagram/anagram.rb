class Anagram
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match(array)
    array.select do |word|
      word.downcase.chars.sort == string.downcase.chars.sort && word.downcase != string.downcase
    end
  end
end