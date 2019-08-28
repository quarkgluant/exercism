class PhoneNumber
  def self.clean(number)
    number =~ (/\A\+?1?[^\d]*([2-9]\d{2})[^\d]*([2-9]\d{2})[^\d]*(\d{4})[^\d]*\Z/) ? "#{$1}#{$2}#{$3}" : nil
  end
end