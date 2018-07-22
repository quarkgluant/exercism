require_relative 'nth_prime'

require 'benchmark'
class PrimeBenchmark
  # Prime.nth(n) gets slow (takes > 1s) when n is around 2^17 (~131_000)
  def self.to_power(power)
    Benchmark.bm do |bm|
      1.upto(power) do |p|
        bm.report("nth(#{2**p}):") { Prime.nth(2**p) }
      end
    end
  end
end

PrimeBenchmark.to_power(16)