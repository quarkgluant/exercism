class Alphametics
  WORD_BOUNDARIES = /\b[A-Z]+\b/
  NUMBER_BOUNDARIES = /\b\d+\b/

  def self.solve(puzzle)
    @puzzle = puzzle
    # p extract_words
    summ = extract_words.last
    operands = extract_words[0...-1]
    numbers = (0..9).to_a
    @result = Hash.new(0)
    my_letters = letters
    resolve(@puzzle, my_letters, numbers, @result)
    # p summ
    # p operands
    # letters = letters
    # p letters
    @result
  end

  def self.resolve(puzzle, letters, numbers, result)
    return result if numbers.size == 1 or letters.size == 1

    letters.each do |letter|
      numbers.each do |number|
        return true if is_valid?(puzzle)

        result[letter] = number
        puzzle.tr(letter, number.to_s)
        new_numbers = numbers - [number]
        new_letters = letters - [letter]
        resolve(puzzle, new_letters, new_numbers, result)
      end
    end
  end

  def self.extract_words
    @puzzle.scan(WORD_BOUNDARIES)
  end

  def self.extract_letters(word)
    word.split('')
  end

  def self.letters
    extract_words.inject([]) do |ary, word|
      ary << extract_letters(word)
    end.flatten.uniq
  end

  def self.is_valid?(puzzle)
    return false if puzzle.match /[A-Z]/

    *operands, summ = puzzle.scan(NUMBER_BOUNDARIES)
    operands.map(&:to_i).inject(&:+) == summ.to_i
  end
end