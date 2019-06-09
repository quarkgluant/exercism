using System;

public static class Gigasecond
{
    private const int _billionExpo = 9;
    public static DateTime Add(DateTime moment)
        => moment.AddSeconds(Math.Pow(10, _billionExpo));
}