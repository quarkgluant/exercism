class Alphametics
  NUMBER_LIST = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

  def self.solve(puzzle)
       new().solve(puzzle)
  end

  def solve(equation)
    solutions(letter_list(equation)) do |sol|
      return sol if test_solution(sol, equation)
    end
    {}
  end

  private

  def solutions(letters)
    return enum_for(:solutions) unless block_given?

    NUMBER_LIST.permutation(letters.count) do |perm|
      yield letters.zip(perm).to_h
    end
  end

  # Get all the unique letters in the equation
  def letter_list(equation)
    equation.gsub(/[^A-Z]/, '').chars.uniq
  end

  def test_solution(solution, equation)
    tr_bits = sol_to_tr(solution)
    expr = equation.tr(tr_bits[:letters], tr_bits[:digits])
    expr = expr.gsub('^', '**') # Use Ruby exponent
    return false if /\b0/ =~ expr
    eval(expr) == true # rubocop:disable Lint/Eval
  end

  def sol_to_tr(solution)
    letters = []
    digits = []
    solution.each do |letter, digit|
      letters << letter
      digits << digit
    end
    { letters: letters.join(''), digits: digits.join('') }
  end
end
