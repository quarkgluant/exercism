class ArmstrongNumbers
  def self.include?(number)
    length = number.to_s.length
    number.to_s.chars.inject(0) { |sum, digit| sum += digit.to_i ** length } == number
  end
end