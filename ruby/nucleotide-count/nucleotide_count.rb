class Nucleotide
  def initialize(dna_strand = '')
    raise ArgumentError if dna_strand =~ /[^AGTC]/

    @dna_strand = dna_strand
  end

  class << self
    alias_method :from_dna, :new
  end

  def count(nucleotide)
    @dna_strand.count nucleotide
  end

  def histogram
    histo = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    @dna_strand.each_char { |nucleotide| histo[nucleotide] += 1 }
    histo
  end
end
