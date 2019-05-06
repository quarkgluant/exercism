class Nucleotide
  DNA = %w(A T C G)
  INITIAL_COUNT = [0] * 4

  def initialize(dna_strand = '')
    raise ArgumentError if dna_strand =~ Regexp.new("[^#{DNA.join}]")

    @dna_strand = dna_strand
  end

  class << self
    alias_method :from_dna, :new
  end

  def count(nucleotide)
    @dna_strand.count nucleotide
  end

  def histogram
    @dna_strand
        .each_char
        .each_with_object(initial_histo){ |nucleotide, histo| histo[nucleotide] += 1 }
  end

  private

  def initial_histo
    DNA.zip(INITIAL_COUNT).to_h
  end
end
