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

  def saddle_points
    result = []
    rows.each_with_index do |row, abscissa|
      columns.each_with_index do |col, ordinate|
        result << [abscissa, ordinate] if col.min == row.max
      end
    end
    result
  end
end