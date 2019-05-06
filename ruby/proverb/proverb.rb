class Proverb
  def initialize(*words, qualifier: qualifier)
    initial_word = "#{qualifier} #{words.first}".lstrip
    @result = words.each_cons(2).each_with_object("") do |pair, string|
      first_word, second_word = pair
      string << "For want of a #{first_word} the #{second_word} was lost.\n"
    end  << "And all for the want of a #{initial_word}."
  end
  
  def to_s
    @result
  end
end