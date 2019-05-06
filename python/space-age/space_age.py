class SpaceAge(object):
    EARTH_YEAR_SECONDS=31557600
    PLANETS_PERIOD=dict(
        on_earth=1,
        on_mercury=0.2408467,
        on_venus=0.61519726,
        on_mars=1.8808158,
        on_jupiter=11.862615,
        on_saturn=29.447498,
        on_uranus=84.016846,
        on_neptune=164.79132
    )

    def __init__(self, seconds):
        self.seconds =  seconds
        for planet, period in self.PLANETS_PERIOD.items():
               setattr(self, planet, self._years_on_planet(self.EARTH_YEAR_SECONDS * period))

    def _years_on_planet(self, period):
        return lambda period = period: round(self.seconds /  period, 2)
