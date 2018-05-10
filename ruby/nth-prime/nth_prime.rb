module BookKeeping
  VERSION = 1
end

class Prime

  def self.nth(rank_prime)
    raise ArgumentError if rank_prime < 1
    return 2 if rank_prime == 1
    return 3 if rank_prime == 2
    prime_array = [2]
    index = 1
    (3..(rank_prime**2)).each do |integer|
      if prime_array.none? { |number| (integer % number).zero? && number != integer }
        prime_array << integer
        index += 1
        break if index == rank_prime
      end
    end
    prime_array[rank_prime - 1]
  end

end