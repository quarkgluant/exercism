using System;

public enum ResistorColors
{
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white
};
public static class ResistorColor
{

    public static int ColorCode(string color)
    {
        Enum.TryParse(typeof(ResistorColors), color, true, out var result);
        return (int)result;
    }

    public static string[] Colors()
        => Enum.GetNames(typeof(ResistorColors));


}