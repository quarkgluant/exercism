class PerfectNumbers

  class << self

    def classify(number)
      raise RuntimeError if number <= 0 || !number.is_a?(Integer)

      case number <=> aliquot_sum(number)
      when -1
        "abundant"
      when 1
        "deficient"
      when 0
        "perfect"
      end
    end

    private

    def aliquot_sum(number)
      aliquot_parts(number).sum
    end

    def aliquot_parts(number)
      (1...number).to_a.each_with_object([]) do |part, array|
        array << part if (number % part).zero?
      end
    end

  end
end