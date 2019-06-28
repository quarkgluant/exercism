class Luhn
  def initialize(input)
    @input = input.delete(' ')
  end

  def self.valid?(input)
    new(input).valid?
  end

  def valid?
    @input.length >= 2 && !(@input =~ /[^\d]/) && checksum % 10 == 0
  end

  private

  def double(digit)
    if digit.nil?
      0
    else
      (digit * 2 > 9) ? digit * 2 - 9 : digit * 2
    end
  end

  def digits
    @input.chars.reverse.map(&:to_i)
  end

  def checksum
    digits.each_slice(2).sum { |first, second| first + double(second) }
  end

end
