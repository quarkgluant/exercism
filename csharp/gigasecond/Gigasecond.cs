using System;

public static class Gigasecond
{
    const int billionExpo = 9;
    public static DateTime Add(DateTime moment)
        => moment.AddSeconds(Math.Pow(10, billionExpo));
}