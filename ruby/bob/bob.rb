class Bob 
  def self.hey(remark)
    case remark.strip
      when /^\s*\z/
        "Fine. Be that way!"
      when /[^a-z]+\s[A-Z]+\?\z/
        "Calm down, I know what I'm doing!"
      when /([a-z]|\d|\s)+[^a-z]*\?\z/
        "Sure."
      when /\.+\?\z/
        "Sure."
      when /[A-Z]+(\d*!?)*\z/
        "Whoa, chill out!"
      when /[a-z]+\s*[A-Z]*(!|\.)*\z/
        "Whatever."
      when /\d\W*\z/
        "Whatever."
    end
  end
end

module BookKeeping
  VERSION = 2
end
