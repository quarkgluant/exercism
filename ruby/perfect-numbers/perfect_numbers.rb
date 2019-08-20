class PerfectNumbers

  class << self
    def classify(number)
      raise RuntimeError if number <= 0

      factors_sum = aliquot_sum(number)
      if factors_sum < number
        'deficient'
      elsif factors_sum > number
        'abundant'
      else
        'perfect'
      end
    end

    private

    def aliquot_sum(number)
      factors(number).sum
    end

    def factors(number)
      (1...number).to_a.each_with_object([]) do |part, array|
        array << part if (number % part).zero?
      end
    end

  end
end