class Nucleotide
  # alias_method from_dna, initialize
  attr_accessor :dna_strand

  class << self
    def from_dna(dna_strand = '')
      dna_strand = dna_strand
    end

    def count(nucleotide)
      dna_strand.match(nucleotide)[0].size
    end

    def histogram
      histo = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
      return histo if dna_strand.size.zero?

      dna_strand.chars.uniq.each do |nucleotide|
        histo[nucleotide] = dna_strand.count(nucleotide)
      end
      histo
    end
  end
end
