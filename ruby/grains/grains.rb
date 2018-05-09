module BookKeeping
  VERSION = 1
end

class Grains
  class << self
    def square(case_number)
      raise ArgumentError if case_number < 1 || case_number > 64
      2**(case_number - 1)
    end

    def total
      (1..64).inject { |accu, kase| accu += square kase }
    end
  end
end