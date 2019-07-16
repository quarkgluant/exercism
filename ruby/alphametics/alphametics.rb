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
    first_or_alone_letters = first_letters
    solver = build_solver
    all_permutations = (0..9).to_a.permutation(letters.length)
    all_permutations.each do |permutation|
      soluce = letters.zip(permutation).to_h
      next if first_or_alone_letters.any? { |letter| soluce[letter].zero? }
      return soluce if solver.call(permutation)
    end
    {}
  end

  def build_solver
    left = left_words.map {|word| transform_operands(word) }.join('+')
    right = transform_operands(right_word)
    to_test = "#{left} == #{right}"
    args = letters.map(&:downcase).join(',')
    eval <<-RUBY
      Proc.new do |#{args}|
        #{to_test}
      end
    RUBY
  end

  def transform_operands(word)
    word = word.downcase
    return word+".to_i" if word.length == 1
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
