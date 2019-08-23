class SumOfMultiples
  attr_accessor :seeds

  def initialize(*seeds)
    @seeds = seeds << 0
  end

  def to(upper_bound)
    multiples(upper_bound).size > 0 ? multiples(upper_bound).sum : 0
  end

  def multiples(bound)
    upper_bound = seeds.min(2).last.zero? ? bound : bound / seeds.min(2).last
    (1..upper_bound).each_with_object([]) { |number, result| result << compute_multiples(number, bound) }.flatten.uniq
  end

  private

  def compute_multiples(number, bound)
    seeds.map { |seed| seed * number < bound ? seed * number : 0 }
  end
end