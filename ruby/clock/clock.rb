class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    if minute >= 60 or minute < 0
      hour += minute / 60
      minute = minute % 60
    end
    @hour = hour % 24
    @minute = minute % 60
    @time = Time.new(2019, 1, 1, @hour, @minute)
  end

  def +(other)
    Clock.new(hour: self.hour + other.hour, minute: self.minute + other.minute)
  end

  def -(other)
    Clock.new(hour: self.hour - other.hour, minute: self.minute - other.minute)
  end

  def ==(other)
    self.hour == other.hour && self.minute == other.minute
  end

  def to_s
    @time.strftime("%R")
  end
end