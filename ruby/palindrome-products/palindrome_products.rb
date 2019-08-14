class Palindromes
  Palindrome = Struct.new :value, :factors

  def initialize(max_factor: , min_factor: 1)
    @max_factor, @min_factor = max_factor, min_factor
  end

  def generate
    @palindromes_with_products = Hash[pairs.zip(products)].select { |_, product| is_palindrome?(product) }
    @palindromes = @palindromes_with_products.values.uniq
  end

  def largest
    max = @palindromes.max
    Palindrome.new max, products_with_palindrome[max]
  end

  def smallest
    min = @palindromes.min
    Palindrome.new min, products_with_palindrome[min]
  end

  private

  def is_palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def products_with_palindrome
    products_with_palindrome = Hash.new { |hash, key| hash[key] = [] }
    @palindromes_with_products.each_with_object(products_with_palindrome) do |(product, palidrome), hash|
      hash[palidrome] << product
    end
  end

  def pairs
    (@min_factor..@max_factor).to_a.repeated_combination(2)
  end

  def products
    pairs.map { |pair| pair.first * pair.last }
  end

end