class RunLengthEncoding

  class << self

    def encode(input)
      input = input.chars
      output = []
      index = 0
      while index < input.length
        sub_index = index + 1
        char = input[index]
        sub_index += 1 while char == input[sub_index]
        output << (sub_index - index).to_s if (sub_index - index) != 1
        index = sub_index
        output << char
      end
      output.join('')
    end

    def decode(input)
      input = input.chars
      output = []
      index = 0
      while index < input.length
        number = []
        while input[index] =~ /\d/
          number << input[index]
          index += 1
        end
        number = number.length > 0 ? number.join('').to_i : 1
        letter = input[index]
        output << (letter * number.to_i)
        index += 1
      end
      output.join('')
    end
  end

end