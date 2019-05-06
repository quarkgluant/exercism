class Palindromes
  Palindrome = Struct.new :value, :factors

  def initialize(**factors)
    @max_factor = factors[:max_factor]
    @min_factor = factors[:min_factor] || 1
  end

  def generate
    pairs = (@min_factor..@max_factor).to_a.repeated_combination(2)
    products = pairs.map { |pair| pair.first * pair.last }
    @palindromes = Hash[pairs.zip(products)].select { |_, product| is_palindrome?(product) }
    @palindromes
  end

  def largest
    factors = @palindromes.select {|_, product| product == @palindromes.values.max }
    Palindrome.new factors.values.first, factors.keys
  end

  def smallest
    factors = @palindromes.select {|_, product| product == @palindromes.values.min }
    Palindrome.new factors.values.first, factors.keys
  end

  private

  def is_palindrome?(number)
    number.to_s.chars == number.to_s.chars.reverse
  end

end