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
    if sum
      triplets = triplets.select { |x, y, z| x + y + z == sum  }
    end
    triplets.select { |x, y, z| x**2 + y**2 == z**2 }
            .map {|x, y, z| Triplet.new(x, y, z) }
  end
end
