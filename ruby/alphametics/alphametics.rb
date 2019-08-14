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
    right = transform_operands(right_word).tr('+', '-')
    equation = "#{left}-#{right}"
    # puts first_letter_longest_operand
    # puts "equation: #{equation}"
    new_equation = reduction(equation).chop.chop
    # puts "new_equation: #{new_equation}"
    args = letters.map(&:downcase).join(',')
    eval <<-RUBY
      Proc.new do |#{args}|
        #{first_letter_not_nul} && #{new_equation} == 0
      end
    RUBY
  end

  def reduction(equation)
    letters.map(&:downcase).each_with_object("") do |letter, new_equation|
      new_equation << symplify(letter, equation) + '+'
    end << '0'
  end

  def symplify(letter, equation)
    res = equation.scan(/(\+|-)?#{letter}\*(\d+)/).each_with_object("") do |m, str|
      unary =  m[0].nil? ? '+' : m[0]
      str << '(' + unary + m[1] + ')' + '+'
    end << '0'
    new_coef = eval res
    "#{new_coef}*#{letter}"
  end

  def first_letter_not_nul
    first_letters.map(&:downcase).each_with_object([]) do |letter, result|
      result << "#{letter} != 0"
    end.join('&&')
  end

  def first_letter_longest_operand
    right_word.chars.first if length_right_word > lengths_left_words.max
  end

  def transform_operands(word)
    word = word.downcase
    return "#{word}*1" if word.length == 1

    word.reverse.chars.each_with_index.with_object([]) do |(letter, index), result|
      result << "#{letter}*1#{'0'*index}"
    end.join('+')
  end

  def left_words
    @puzzle.split('==').first.scan(WORD_BOUNDARIES)
  end

  def lengths_left_words
    left_words.map &:length
  end

  def right_word
    @puzzle.split('==')[-1].scan(WORD_BOUNDARIES).first
  end

  def length_right_word
    right_word.length
  end

  def letters
    @puzzle.scan(LETTERS).uniq
  end

  def first_letters
    @puzzle.scan(FIRST_LETTERS).flatten
  end

end
