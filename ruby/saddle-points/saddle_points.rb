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
    [].tap do |result|
      rows.each_with_index do |row, abscissa|
        columns.each_with_index do |col, ordinate|
          result << [abscissa, ordinate] if saddle_points?(col, row)
        end
      end
    end
  end

  def saddle_points?(column, row)
    column.min == row.max
  end

end