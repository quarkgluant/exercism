class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sum
    (0..@number).reduce(:+) ** 2
  end

  def sum_of_squares
    (0..@number).inject(0){ |sum, x| sum + x ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end