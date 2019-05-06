class Triplet
  def initialize(*triplet)
    @triplet = triplet.sort
  end

  def sum
    @triplet.sum
  end

  def product
    @triplet.inject(1, &:*)
  end

  def pythagorean?
    @triplet.last ** 2 == (@triplet[0] ** 2 + @triplet[1] ** 2)
  end

  def self.where(**kargs)
    max_factor = kargs[:max_factor]
    min_factor = kargs[:min_factor] || 1
    sum = kargs[:sum]
    triplets = (min_factor..max_factor)
         .to_a
         .combination(3)
         .select { |x, y, z| Triplet.new(x, y, z).pythagorean? }
    if sum
      triplets = triplets.select { |x, y, z| x + y + z == sum }
    end
    triplets.map {|x, y, z| Triplet.new(x, y, z) }
  end
end
