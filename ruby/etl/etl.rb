class ETL
  def self.transform(old)
    old.invert.each_with_object({}) { |(array, value), result|
      array.each do |letter|
        result[letter.downcase] = value
      end
    }
  end
end