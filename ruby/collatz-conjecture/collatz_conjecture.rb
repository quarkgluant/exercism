class CollatzConjecture

  class << self

    def steps(number)
      raise ArgumentError if number <= 0

      count_steps(number, []).size
    end

    private

    def count_steps(number, array)
      return array if number == 1

      array << number
      number = if number.even?
                 number / 2
               else
                 3 * number + 1
               end
      count_steps(number, array)
    end
  end
end