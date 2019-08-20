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

  def less_than_ten(time)
    time < 10 ? "0#{time}" : time
  end

  def to_s
    hour = less_than_ten(minute / MINUTES_PER_HOUR % HOURS_PER_DAY)
    minute = less_than_ten(@minute % MINUTES_PER_HOUR)
    "#{hour}:#{minute}"
  end
end