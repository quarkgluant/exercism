class Robot
  attr_reader :name
  NAME_TANK = 'AA000'..'ZZ999'

  def self.forget
    @@names = NAME_TANK.to_a.shuffle.to_enum
  end

  self.forget

  def initialize
    @name = @@names.next
  end

  def reset
    @name = @@names.next
  end

end
