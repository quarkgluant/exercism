class SpaceAge
  EARTH_YEAR_SECONDS = 31557600
  PLANETS_PERIOD = {
      earth:   1,
      mercury: 0.2408467,
      venus:   0.61519726,
      mars:    1.8808158,
      jupiter: 11.862615,
      saturn:  29.447498,
      uranus:  84.016846,
      neptune: 164.79132
  }

  def initialize(seconds)
    @age_on_earth = seconds.to_f / EARTH_YEAR_SECONDS
  end

  PLANETS_PERIOD.each do |planet, period|
    define_method("on_#{planet}") do
      @age_on_earth / period
    end
  end
end
