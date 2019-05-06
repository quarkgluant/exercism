class Triangle
  def initialize(triangle)
    @triangle = triangle
  end

  def equilateral?
    @triangle.all? { |side| side == @triangle.first && !side.zero? }
  end

  def isosceles?
    @triangle.push(@triangle.first).each_cons(2).any? { |sides| sides[0] == sides[1] && sides != [1, 1] }
  end

  def scalene?
    !(equilateral? || isosceles?) && @triangle.max <= (@triangle - [@triangle.max]).inject(&:+)
  end
end