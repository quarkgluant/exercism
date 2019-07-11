class AlphameticsOld
  WORD_BOUNDARIES = /\b[A-Z]+\b/
  NUMBER_BOUNDARIES = /\b\d+\b/

  def self.solve(puzzle)
    new(puzzle).resolve
  end

  def initialize(puzzle)
    @puzzle = puzzle
  end

  def resolve
    results = []
    numbers = (0..9).to_a
    numbers.permutation(letters.length) do |permutation|
      result = letters.zip(permutation).to_h
      results << result if is_valid?(result)
      break if results.length > 1
    end
    results.length != 1 ? {} : results.first
  end

  def words
    @puzzle.scan(WORD_BOUNDARIES)
  end

  def letters
    words.each_with_object([]) do |word, array|
      array << word.chars
    end.flatten.uniq
  end

  def is_valid?(result)
    numeric_puzzle = @puzzle.chars.each_with_object([]) do |char, new_puzzle|
      if char =~ /\w/
        new_puzzle << result[char]
      else
        new_puzzle << char
      end
    end.join('')
    *operands, summ = numeric_puzzle.scan(NUMBER_BOUNDARIES)
    return false if summ.start_with?('0') || operands.any? { |number| number.start_with?("0") }

    operands.map(&:to_i).sum == summ.to_i
  end
end
