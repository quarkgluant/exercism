class Transpose
  def self.transpose(input)
    matrix = input_matrix(input)
    rows_size = matrix.map {|row| row.length }
    p "rows_size: #{rows_size}"
    p matrix
    # if rows_size.max != rows_size.min
    #   matrix = matrix.map { |row| row.size < rows_size.max ? row << ' ' : row }
    # end
    # p "after normalizations"
    return "" if rows_size.max.nil?
    transpose = transpose_matrix(matrix, rows_size.max, matrix.size)
    # transpose = transpose_matrix(matrix, rows_size, matrix.size)
    transpose.reverse.map do |row|
      break unless row.include? ' '
      while row.last == ' '
        row.delete_at(-1)
      end
    end
    p transpose
    transpose.map {|sub_array| sub_array.join('')}.join("\n")
  end

  private

  def self.input_matrix(input)
    matrix = input.each_line.with_object([]) do |line, matrix|
      matrix << line.chomp.chars
    end
  end

  def self.transpose_matrix(matrix, col_size, row_size)
    # transpose = col_size.each_with_object([]) {|size, result| result << Array.new(row_size, ' ') }
    # transpose = (col_size - 1).times.with_object([]) {|index, result| result << Array.new(row_size, ' ') }
    transpose = col_size.times.with_object([]) {|_, result| result << Array.new(row_size, ' ') }
    # transpose << []
    # p transpose
    matrix.each_with_index.with_object(transpose) do |(row, row_index), transpose|
      row.each_with_index { |char, col_index| transpose[col_index][row_index] = char }
    end
  end
end