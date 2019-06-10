class Triplet
  def initialize(*triplet)
    @triplet = triplet.sort
  end

  def sum
    @triplet.sum
  end

  def product
    @triplet.inject(&:*)
  end

  def pythagorean?
    first, second, third = @triplet
    third**2 == (first**2 + second**2)
  end

  def self.where(max_factor:, min_factor: 1, sum: nil)
    triplets = (min_factor..max_factor)
         .to_a
         .combination(3)
    triplets = triplets.select { |x, y, z| x + y + z == sum  } if sum
    triplets.map {|x, y, z| Triplet.new(x, y, z) }
            .select(&:pythagorean?)
  end
end
