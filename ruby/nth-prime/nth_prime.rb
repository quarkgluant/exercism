module BookKeeping
  VERSION = 1
end

# class Prime

#   def self.nth(rank_prime)
#     raise ArgumentError if rank_prime < 1
#     prime_array = [2]
#     index = 1
#     (3..(rank_prime**2)).each do |integer|
#       if prime_array.none? { |prime_number| (integer % prime_number).zero? && prime_number != integer }
#         prime_array << integer
#         index += 1
#         break if index == rank_prime + 1
#       end
#     end
#     prime_array[rank_prime]
#   end

# end

class Prime

  def self.nth(rank_prime)
    raise ArgumentError if rank_prime < 1
    prime_array = [2]
    index = 1
    next_integer = 3
    while next_integer < rank_prime**2
      if prime_array.none? { |prime_number| (next_integer % prime_number).zero? && prime_number != next_integer }
        prime_array << next_integer
        index += 1
        break if index == rank_prime + 1
      end
      next_integer += 2
    end
    prime_array[rank_prime]
  end


end