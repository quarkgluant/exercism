class Series
  def initialize(number)
    @number = number.chars
  end

  def slices(length)
    raise ArgumentError unless @number.length >= length

    @number.each_cons(length).map &:join
  end
end