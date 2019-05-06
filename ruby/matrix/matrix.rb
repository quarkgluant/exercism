class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    @matrix.each_line.map do |line|
      line.scan(/\d+/).map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end
end