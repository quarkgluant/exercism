module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError, "the strands have not the same numbers of nucleotides" unless strand2.size == strand1.size
    strand2.chars.zip(strand1.chars).select{ |n1, n2| n1 != n2 }.count
  end
end