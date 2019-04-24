class Brackets
  BRACKETS = { '}' => '{', ']' => '[', ')' => '(' }
  OPENING = BRACKETS.keys
  CLOSING = BRACKETS.values

  def self.paired?(text)
    stack = []
    text.each_char do |char|
      if CLOSING.include? char
        stack << char
      elsif OPENING.include? char
        open_bracket = stack.pop
        expected_closing_bracket = BRACKETS[char]
        return false unless open_bracket == expected_closing_bracket
      end
    end
    stack.empty?
  end
end
