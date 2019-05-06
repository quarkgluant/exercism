class Raindrops
  INTEGERS = [3, 5, 7]
  VOYELS = INTEGERS.zip(%w(i a o)).to_h

  def self.convert(number)
    result = INTEGERS.each_with_object("") do |index, string|
      string << "Pl#{VOYELS[index]}ng" if number % index == 0
    end
    result << "#{number}" if result.empty?
    result
  end
end