class SumOfMultiples
  def initialize(*seeds)
    @seeds = seeds << 0
  end

  def to(upper_bound)
    multiples(upper_bound).size > 0 ? multiples(upper_bound).sum : 0
  end

  def multiples(bound)
    upper_bound = @seeds.min(2).last.zero? ? bound : bound / @seeds.min(2).last
    (1..upper_bound).each_with_object([]) do |number, result|
      result << @seeds.map { |seed| seed * number < bound  ? seed * number  : 0 }
    end.flatten.uniq
  end

end