class Alphametics
  LETTERS = /[A-Z]/
  FIRST_LETTERS = /\b([A-Z])[A-Z]*\b/
  WORD_BOUNDARIES = /\b[A-Z]+\b/

  def self.solve(puzzle)
    new(puzzle).resolve
  end

  def initialize(puzzle)
    @puzzle = puzzle
  end

  def resolve
    solver = build_solver
    (0..9).to_a.permutation(letters.length).each do |permutation|
      return letters.zip(permutation).to_h if solver.call(permutation)
    end
    {}
  end

  def build_solver
    left = left_words.map {|word| transform_operands(word) }.join('+')
    right = transform_operands(right_word)
    equation = "#{left} == #{right}"
    args = letters.map(&:downcase).join(',')
    eval <<-RUBY
      Proc.new do |#{args}|
        #{first_letter_not_nul} && #{equation}
      end
    RUBY
  end

  def first_letter_not_nul
    first_letters.map(&:downcase).each_with_object([]) do |letter, result|
      result << "#{letter} != 0"
    end.join('&&')
  end

  def transform_operands(word)
    word = word.downcase
    return word if word.length == 1
    tmp = word.chars.map{|char| "#{char}.to_s" }.join('+')
    "(" + tmp + ").to_i"
  end

  def left_words
    @puzzle.split('==').first.scan(WORD_BOUNDARIES)
  end


  def right_word
    @puzzle.split('==')[-1].scan(WORD_BOUNDARIES).first
  end

  def letters
    @puzzle.scan(LETTERS).uniq
  end

  def first_letters
    @puzzle.scan(FIRST_LETTERS).flatten
  end

end
