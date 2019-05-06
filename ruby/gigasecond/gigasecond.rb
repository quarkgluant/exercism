class Gigasecond
  def self.from(date)
    Time.at(date.to_i + 1_000_000_000)
  end
end