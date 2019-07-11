class Alphametics
  LETTERS = /[A-Z]/
  FIRST_DIGITS = /\b(\d)\d*\b/
  WORD_BOUNDARIES = /\b[A-Z]+\b/
  DIGIT_BOUNDARIES = /\b\d+\b/


  def self.solve(puzzle)
    new(puzzle).resolve
  end

  def initialize(puzzle)
    @puzzle = puzzle
    @solver = ->  (puzzle) { eval puzzle }
  end

  def resolve
    # all_permutations = (0..9).to_a.permutation(letters.length)
    (0..9).to_a.permutation(letters.length).each do |permutation|
      puzzle = @puzzle.tr(letters.join(''), permutation.join(''))
      next if first_digits_zero?(puzzle)
      *operandes, sum = puzzle.scan(DIGIT_BOUNDARIES).map &:to_i

      return letters.zip(permutation).to_h if @solver.call(puzzle)
      # return letters.zip(permutation).to_h if operandes.sum == sum
    end
    {}
  end


  #
  # def words
  #   @puzzle.scan(WORD_BOUNDARIES)
  # end

  def letters
    @puzzle.scan(LETTERS).uniq
  end

  def first_digits_zero?(puzzle)
    puzzle.scan(FIRST_DIGITS).flatten.any? {|char| char == '0'}
  end

end
