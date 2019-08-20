class Clock
  attr_reader :minute
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24

  def initialize(hour: 0, minute: 0)
    @minute = format(hour: hour, minute: minute)
  end

  def format(hour: 0, minute: 0)
    minute += (hour * MINUTES_PER_HOUR)
    minute %= (HOURS_PER_DAY * MINUTES_PER_HOUR)
  end

  def +(other)
    Clock.new(minute: self.minute + other.minute)
  end

  def -(other)
    Clock.new(minute: self.minute - other.minute)
  end

  def ==(other)
    self.minute == other.minute
  end

  def to_s
    hour = minute / MINUTES_PER_HOUR % HOURS_PER_DAY
    minute = @minute % MINUTES_PER_HOUR
    "%02d:%02d" % [hour, minute]
  end
end