class Hamming
  class << self
    def compute(strand1, strand2)
      raise StrandLengthError unless same_length?(strand1, strand2)

      nucleotides = strand2.chars.zip(strand1.chars)
      nucleotides.count { |n1, n2| n1 != n2 }
    end

    private

    def same_length?(s1, s2)
      s1.length == s2.length
    end
  end
end

class StrandLengthError < ArgumentError
  def initialize(message = "Strands must be equal length")
    super
  end
end