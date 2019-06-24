using System;
using System.Collections.Generic;

public class SpaceAge
{
    private const double EARTH_YEAR_SECONDS = 31_557_600;
    
    private IReadOnlyDictionary<string, Func<double, double>> PLANETS_PERIOD_FUNC = new Dictionary<string, Func<double, double>>()
    {
        { "earth", x => Math.Round(x, 2) },
        { "mercury", x => Math.Round(x / 0.2408467, 2) },
        { "venus", x => Math.Round(x  / 0.61519726, 2) },
        { "mars", x => Math.Round(x / 1.8808158, 2) },
        { "jupiter", x => Math.Round(x / 11.862615, 2) },
        { "saturn", x => Math.Round(x / 29.447498, 2) },
        { "uranus", x => Math.Round(x / 84.016846, 2) },
        { "neptune", x => Math.Round(x / 164.79132, 2) }
    };

    public double AgeOnEarth { get; }
    public SpaceAge(double seconds)
    {
        AgeOnEarth = seconds / EARTH_YEAR_SECONDS;
    }
    
    public double OnEarth() => PLANETS_PERIOD_FUNC["earth"](AgeOnEarth);

    public double OnMercury() => PLANETS_PERIOD_FUNC["mercury"](AgeOnEarth);

    public double OnVenus() => PLANETS_PERIOD_FUNC["venus"](AgeOnEarth);

    public double OnMars() => PLANETS_PERIOD_FUNC["mars"](AgeOnEarth);
    
    public double OnJupiter() => PLANETS_PERIOD_FUNC["jupiter"](AgeOnEarth);

    public double OnSaturn() => PLANETS_PERIOD_FUNC["saturn"](AgeOnEarth);

    public double OnUranus() => PLANETS_PERIOD_FUNC["uranus"](AgeOnEarth);

    public double OnNeptune() => PLANETS_PERIOD_FUNC["neptune"](AgeOnEarth);
    
}