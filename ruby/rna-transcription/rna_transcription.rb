module BookKeeping
  VERSION = 4
end

class Complement
  def self.of_dna(strand)
    return "" if strand =~ /[^ATCG]/
    strand.tr("ATCG", "UAGC")
  end
end