using System;
using System.Collections.Generic;

public class SpaceAge
{
    enum Planets
    {
        Earth, Mercury, Venus, Mars, Jupiter, Saturn, Uranus, Neptune
    }
    private const double EARTH_YEAR_SECONDS = 31_557_600;
    
    private IReadOnlyDictionary<Planets, Func<double, double>> PLANETS_PERIOD_FUNC = new Dictionary<Planets, Func<double, double>>()
    {
        { Planets.Earth, x => x },
        { Planets.Mercury, x => x / 0.2408467 },
        { Planets.Venus, x => x  / 0.61519726 },
        { Planets.Mars, x => x / 1.8808158 },
        { Planets.Jupiter, x => x / 11.862615 },
        { Planets.Saturn, x => x / 29.447498 },
        { Planets.Uranus, x => x / 84.016846 },
        { Planets.Neptune, x => x / 164.79132 }
    };

    private double AgeOnEarth { get; }
    public SpaceAge(double seconds)
    {
        AgeOnEarth = seconds / EARTH_YEAR_SECONDS;
    }
    
    public double OnEarth() => PLANETS_PERIOD_FUNC[Planets.Earth](AgeOnEarth);

    public double OnMercury() => PLANETS_PERIOD_FUNC[Planets.Mercury](AgeOnEarth);

    public double OnVenus() => PLANETS_PERIOD_FUNC[Planets.Venus](AgeOnEarth);

    public double OnMars() => PLANETS_PERIOD_FUNC[Planets.Mars](AgeOnEarth);
    
    public double OnJupiter() => PLANETS_PERIOD_FUNC[Planets.Jupiter](AgeOnEarth);

    public double OnSaturn() => PLANETS_PERIOD_FUNC[Planets.Saturn](AgeOnEarth);

    public double OnUranus() => PLANETS_PERIOD_FUNC[Planets.Uranus](AgeOnEarth);

    public double OnNeptune() => PLANETS_PERIOD_FUNC[Planets.Neptune](AgeOnEarth);
    
}