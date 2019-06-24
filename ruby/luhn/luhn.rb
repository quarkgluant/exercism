class Luhn
  class << self

    def valid?(input)
      input_cleaned = input.gsub(' ', '')
      return false if input_cleaned.length < 2 || input_cleaned =~ /[^\d]/

      digits_treated = []
      input_cleaned.chars.reverse.each_slice(2) do |pair|
        digits_treated << pair.first.to_i
        digits_treated << double(pair.last.to_i) unless pair.last.nil?
      end
      digits_treated.sum % 10 == 0
    end

    private

    def double(digit)
      (digit * 2 > 9) ? digit * 2 - 9 : digit * 2
    end

  end
end
