class Brackets
  def self.paired?(string_brackets)
    brackets_stack = []
    closing_pairs_brackets = { '}' => '{', ']' => '[', ')' => '(' }
    string_brackets.each_char do |char|
      if closing_pairs_brackets.value? char
        brackets_stack << char
      elsif closing_pairs_brackets.key? char
        return false unless brackets_stack.pop == closing_pairs_brackets[char]
      end
    end
    brackets_stack.empty?
  end
end
