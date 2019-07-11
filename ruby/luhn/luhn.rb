class Luhn
  def initialize(input)
    @input = input.delete(' ')
  end

  def self.valid?(input)
    new(input).valid?
  end

  def valid?
    return false if @input.length < 2 || @input =~ /[^\d]/

    checksum % 10 == 0
  end

  private

  def double(digit)
    (digit * 2 > 9) ? digit * 2 - 9 : digit * 2
  end

  def digits
    @input.chars.reverse.map(&:to_i)
  end

  def checksum
    digits.each_slice(2).sum { |first, second = 0| first + double(second) }
  end

end
