class Luhn
  class << self

    def valid?(input)
      input_cleaned = input.delete(' ')
      return false if input_cleaned.length < 2 || input_cleaned =~ /[^\d]/

      checksum(digits(input_cleaned)) % 10 == 0
    end

    private

    def double(digit)
      if digit.nil?
        0
      else
        (digit * 2 > 9) ? digit * 2 - 9 : digit * 2
      end
    end

    def digits(input)
      input.chars.reverse.map(&:to_i)
    end

    def checksum(digits)
      digits.each_slice(2).sum { |first, second| first + double(second) }
    end

  end
end
