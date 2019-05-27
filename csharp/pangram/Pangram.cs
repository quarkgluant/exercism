using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        var input_cleaned = Regex.Replace(input.ToLower(), "[^a-z]", "");
        HashSet<char> uniq_chars = new HashSet<char>(input_cleaned);
        return uniq_chars.Count == 26;
    }
}
