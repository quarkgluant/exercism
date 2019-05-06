class Isogram
  def self.isogram?(input)
    array_letters = input.downcase.scan(/\w/)
    array_letters.size == array_letters.uniq.size
  end
end