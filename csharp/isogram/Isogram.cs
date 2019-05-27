using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var word_cleaned = Regex.Replace(word.ToLower(), "[^a-z]", "");
        HashSet<char> uniq_chars = new HashSet<char>(word_cleaned);
        return uniq_chars.Count == word_cleaned.Length;        
    }
}
