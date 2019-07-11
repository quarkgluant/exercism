class AlphameticsOld
  LETTERS = /[A-Z]/
  NUMBER_BOUNDARIES = /\b\d+\b/
  FIRST_LETTERS = /\b([A-Z])[A-Z]*\b/

  def self.solve(puzzle)
    new(puzzle).resolve
  end

  def initialize(puzzle)
    @puzzle = puzzle
  end

  def resolve
    results = []
    all_permutations = (0..9).to_a.permutation(letters.length)
    all_permutations.each do |permutation|
      result = letters.zip(permutation).to_h
      next if first_letters_zero?(result)
      results << result if is_valid?(result)
      break if results.length > 1
    end
    results.length != 1 ? {} : results.first
  end

  def letters
    @puzzle.scan(LETTERS).uniq
  end

  def first_letters_zero?(result)
    @puzzle.scan(FIRST_LETTERS).flatten.any? { |letter| result[letter].zero? }
  end

  def is_valid?(result)
    *operands, summ = numeric_puzzle(result).scan(NUMBER_BOUNDARIES)
     operands.map(&:to_i).sum == summ.to_i
  end

  def numeric_puzzle(result)
    @puzzle.gsub(/\w/, result)
  end
end