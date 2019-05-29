using System;
using System.Text.RegularExpressions;

public static class Acronym
{

    public static string Abbreviate(string phrase)
    {
        string pattern = "([A-Z])[A-Z']*";
        string result = String.Join("", Regex.Split(phrase.ToUpper(), pattern));
        return Regex.Replace(result, @"[^A-Z]", "");
    }
}