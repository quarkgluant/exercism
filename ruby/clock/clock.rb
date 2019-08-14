class Clock
  attr_reader :minute

  def initialize(hour: 0, minute: 0)
    @minute = format(hour: hour, minute: minute)
  end

  def format(hour: 0, minute: 0)
    if minute >= 60 or minute < 0
      hour += minute / 60
    end
    hour %= 24
    minute %= 60
    minute + hour * 60
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

  def hours
    if @minute >= 60 or @minute < 0
      @minute / 60
    else
      0
    end
  end

  def less_than_ten(time)
    time < 10 ? "0#{time}" : time
  end

  def to_s
    hour = hours % 24
    hour = less_than_ten hour
    minute = @minute % 60
    minute = less_than_ten minute
    "#{hour}:#{minute}"
  end
end