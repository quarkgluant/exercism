require 'set'
require 'benchmark'

class Isogram
  def self.isogram?(input)
    array_letters = input.downcase.scan(/\w/)
    Set.new(array_letters).size == array_letters.size
  end
end

class Isogram2
  def self.isogram?(input)
    array_letters = input.downcase.scan(/\w/)
    array_letters.size == array_letters.uniq.size
  end
end

iterations = 100_000

Benchmark.bm do |bm|
  # joining an array of strings
  bm.report do
    iterations.times do
      ["thumbscrew-japingly", "Emily Jung Schwartzkopf", "subdermatoglyphic"].each do |s|
        Isogram.isogram?(s)
      end
    end
  end
  bm.report do
    iterations.times do
      ["thumbscrew-japingly", "Emily Jung Schwartzkopf", "subdermatoglyphic"].each do |s|
        Isogram2.isogram?(s)
      end
    end
  end
end

