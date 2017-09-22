module BookKeeping
  VERSION = 5
end

class Pangram

  def self.pangram? string_to_test
    frequency_letter = Hash.new(0)
    string_to_test.split('').sort.inject(frequency_letter) do |hash , letter|
      letter = letter.downcase
      hash[letter] += 1 if letter =~ /[a-z]/
      hash
    end

    frequency_letter.any? { | _ , value| value > 0 } && frequency_letter.keys.sort == ('a'..'z').to_a

  end

end