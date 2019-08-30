require 'benchmark'

class Palindromes
  attr_reader :palindromes_with_products
  attr_accessor :palindromes

  Palindrome = Struct.new :value, :factors do
    include Comparable

    def <=>(another)
      value <=> another.value
    end
  end

  def initialize(max_factor: , min_factor: 1)
    @max_factor, @min_factor = max_factor, min_factor
  end

  def generate
    @palindromes_with_products = Hash[pairs.zip(products)].select { |_, product| is_palindrome?(product) }
    palindromes_values = palindromes_with_products.values.uniq
    self.palindromes = palindromes_values.map { |value| Palindrome.new value, products_with_palindrome[value] }
  end

  def largest
    palindromes.max
  end

  def smallest
    palindromes.min
  end

  private

  def is_palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def products_with_palindrome
    products_with_palindrome = Hash.new { |hash, key| hash[key] = [] }
    palindromes_with_products.each_with_object(products_with_palindrome) do |(product, palindrome), hash|
      hash[palindrome] << product
    end
  end

  def pairs
    (@min_factor..@max_factor).to_a.repeated_combination(2)
  end

  def products
    pairs.map { |pair| pair.first * pair.last }
  end
end


