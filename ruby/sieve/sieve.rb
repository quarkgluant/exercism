module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize number
    @born_sup = number
  end

  def primes
    multiples = []
    half_born = Math.sqrt(@born_sup).round + 1
    array_of_numbers = (2..@born_sup).to_a 
    (2..half_born).each do |number|
      (0...(@born_sup - 1)).each {|n| multiples << array_of_numbers[n] * number }
    end
    array_of_numbers - multiples.uniq.sort.select{|n| n <= array_of_numbers[@born_sup - 2]}
  end

end

=begin
def primes(born_sup)
  multiples = []
  half_born = Math.sqrt(born_sup).round + 1
  array_of_numbers = (2..born_sup).to_a 
  (2..half_born).each do |number|
    (0..(born_sup - 2)).each {|n| multiples << array_of_numbers[n] * number }
  end
  array_of_numbers - multiples.uniq.sort.select{|n| n <= array_of_numbers[born_sup - 2]}
end
=end